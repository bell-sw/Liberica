FROM debian:stable-slim AS glibc-base

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

FROM alpine:3.8 AS liberica

ARG GLIBC_PREFIX=/usr/glibc

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/usr/lib/jvm/jdk-10.0.2-bellsoft
ARG LIBERICA_VERSION=10.0.2
ARG LIBERICA_VARIANT=jdk

COPY --from=glibc-base /root/dest/ /

RUN LIBERICA_ARCH='' && LIBERICA_ARCH_TAG='' && \
  case `uname -m` in \
        x86_64) \
            LIBERICA_ARCH="amd64"; \
            LIBERICA_ARCH_TAG=".amd64" \
            ;; \
        aarch64) \
            LIBERICA_ARCH="aarch64"; \
            LIBERICA_ARCH_TAG=".ARMv8" \
            ;; \
        armv[67]l) \
            LIBERICA_ARCH="arm32-vfp-hflt"; \
            LIBERICA_ARCH_TAG="" \
            ;; \
        *) \
            LIBERICA_ARCH=`uname -m`; \
            LIBERICA_ARCH_TAG=".`uname -m`" \
            ;; \
  esac  && \
  ln -s ${GLIBC_PREFIX}/lib/ld-*.so* /lib && \
  ln -s ${GLIBC_PREFIX}/etc/ld.so.cache /etc && \
  if [ "$LIBERICA_ARCH" = "amd64" ]; then ln -s /lib /lib64; fi && \
  ${GLIBC_PREFIX}/sbin/ldconfig && \
  \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  wget -O - "https://github.com/bell-sw/Liberica/releases/download/${LIBERICA_VERSION}${MSEP}${LIBERICA_ARCH_TAG}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}.tar.gz" | tar xzf - -C /tmp/java && \
  if [ "$LIBERICA_VARIANT" = "jdk" ]; then \
	rm -rf "${LIBERICA_ROOT}" && \
    ls /tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/jmods/ | sed 's/\.[^.]*$//' | xargs | sed 's/ /,/g' | xargs \
	  /tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin/jlink \
	    --compress 2 \
		--module-path ${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/jmods/ \
		--output  ${LIBERICA_ROOT} \
		--add-modules; \
  else \
	  find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; ; \
  fi && rm -rf /tmp/java

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
