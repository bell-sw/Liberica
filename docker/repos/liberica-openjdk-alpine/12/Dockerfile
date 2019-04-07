FROM debian:stable-slim as glibc-base

ARG GLIBC_VERSION=2.28
ARG GLIBC_PREFIX=/usr/glibc

RUN apt-get update && apt-get install -y \
  curl build-essential gawk bison python3 texinfo gettext \
  && \
  cd /root && \
  curl -SL http://ftp.gnu.org/gnu/glibc/glibc-${GLIBC_VERSION}.tar.gz | tar xzf - && \
  mkdir -p /root/build && cd /root/build && \
  ../glibc-${GLIBC_VERSION}/configure \
    --prefix=${GLIBC_PREFIX} \
    --libdir="${GLIBC_PREFIX}/lib" \
    --libexecdir="${GLIBC_PREFIX}/lib" \
    --enable-multi-arch \
    --enable-stack-protector=strong \
  && \
  make -j`nproc` && make DESTDIR=/root/dest install && \
  cd /root && rm -rf build glibc-${GLIBC_VERSION} && \
  cd /root/dest${GLIBC_PREFIX} && \
  ( strip bin/* sbin/* lib/* || true ) && \
  echo "/usr/local/lib" > /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "${GLIBC_PREFIX}/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/usr/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf

RUN cd /root/dest${GLIBC_PREFIX} && \
  rm -rf etc/rpc var include share bin sbin/[^l]*  \
	lib/*.o lib/*.a lib/audit lib/gconv lib/getconf

#sbin/[^l]*

FROM alpine:3.8 as liberica

ARG GLIBC_PREFIX=/usr/glibc
ARG EXT_GCC_LIBS_URL=https://archive.archlinux.org/packages/g/gcc-libs/gcc-libs-8.2.1%2B20180831-1-x86_64.pkg.tar.xz
ARG EXT_ZLIB_URL=https://archive.archlinux.org/packages/z/zlib/zlib-1%3A1.2.11-3-x86_64.pkg.tar.xz

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/usr/lib/jvm/jdk-12-bellsoft
ARG LIBERICA_VERSION=12
ARG LIBERICA_VARIANT=jdk
ARG LIBERICA_USE_LITE=1

COPY --from=glibc-base /root/dest/ /

RUN LIBERICA_ARCH='' && LIBERICA_ARCH_TAG='' && \
  case `uname -m` in \
        x86_64) \
            LIBERICA_ARCH="amd64" \
            ;; \
        i686) \
            LIBERICA_ARCH="i586" \
            ;; \
        aarch64) \
            LIBERICA_ARCH="aarch64" \
            ;; \
        armv[67]l) \
            LIBERICA_ARCH="arm32-vfp-hflt"; \
            ;; \
        *) \
            LIBERICA_ARCH=`uname -m` \
            ;; \
  esac  && \
  ln -s ${GLIBC_PREFIX}/lib/ld-*.so* /lib && \
  ln -s ${GLIBC_PREFIX}/etc/ld.so.cache /etc && \
  if [ "$LIBERICA_ARCH" = "amd64" ]; then ln -s /lib /lib64 && \
  mkdir /tmp/zlib && wget -O - "${EXT_ZLIB_URL}" | tar xJf - -C /tmp/zlib && \
  cp -dP /tmp/zlib/usr/lib/libz.so* "${GLIBC_PREFIX}/lib" && \
  rm -rf /tmp/zlib && \
  mkdir /tmp/gcc && wget -O - "${EXT_GCC_LIBS_URL}" | tar xJf - -C /tmp/gcc && \
  cp -dP /tmp/gcc/usr/lib/libgcc* /tmp/gcc/usr/lib/libstdc++* "${GLIBC_PREFIX}/lib" && \
  rm -rf /tmp/gcc; fi && \
  ${GLIBC_PREFIX}/sbin/ldconfig && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' > /etc/nsswitch.conf && \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  RSUFFIX="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then RSUFFIX="-lite"; fi && \
  wget -O - "https://download.bell-sw.com/java/${LIBERICA_VERSION}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}-lite.tar.gz" | \
    tar xzf - -C /tmp/java && \
  find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}${RSUFFIX}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  rm -rf /tmp/java

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

