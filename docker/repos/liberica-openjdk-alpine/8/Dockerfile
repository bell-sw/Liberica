FROM debian:12-slim as glibc-base

ARG GLIBC_VERSION=2.36
ARG GLIBC_PREFIX=/usr/glibc
ARG LANG=en_US.UTF-8

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
  RTLD=`find /root/dest${GLIBC_PREFIX}/lib -name 'ld-linux-*.so.*'` && [ -x "$RTLD" ] && \
  LOCALEDEF="$RTLD --library-path /root/dest${GLIBC_PREFIX}/lib /root/dest${GLIBC_PREFIX}/bin/localedef --alias-file=/root/glibc-${GLIBC_VERSION}/intl/locale.alias" && \
  export I18NPATH=/root/glibc-${GLIBC_VERSION}/localedata && \
  export GCONVPATH=/root/glibc-${GLIBC_VERSION}/iconvdata && \
  LOCALE=$(echo ${LANG} | cut -d. -f1) && CHARMAP=$(echo ${LANG} | cut -d. -f2) && \
  mkdir -pv /root/dest${GLIBC_PREFIX}/lib/locale && \
  cd /root/glibc-${GLIBC_VERSION}/localedata && \
  ${LOCALEDEF} -i locales/$LOCALE -f charmaps/$CHARMAP --prefix=/root/dest $LANG && \
  cd /root && rm -rf build glibc-${GLIBC_VERSION} && \
  cd /root/dest${GLIBC_PREFIX} && \
  ( strip bin/* sbin/* lib/* || true ) && \
  echo "/usr/local/lib" > /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "${GLIBC_PREFIX}/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/usr/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf

RUN cd /root/dest${GLIBC_PREFIX} && \
  rm -rf etc/rpc var include share bin "sbin/[^l]*"  \
        lib/*.o lib/*.a lib/audit lib/gconv lib/getconf

FROM alpine:3.21 as liberica

ARG GLIBC_PREFIX=/usr/glibc
ARG EXT_GCC_LIBS_URL=https://archive.archlinux.org/packages/g/gcc-libs/gcc-libs-8.3.0-1-x86_64.pkg.tar.xz
ARG EXT_GCC_LIBS_URL_AARCH64=https://download.bell-sw.com/archives/aarch64/gcc-libs-9.3.0-1-aarch64.pkg.tar.xz
ARG EXT_GCC_LIBS_SHA256_AARCH64=cd4dfebb74a170fcae47fd12c4d2fef4cf6dc337a2edbb57c84a3a92afc9d89a
ARG EXT_ZLIB_URL=https://archive.archlinux.org/packages/z/zlib/zlib-1%3A1.2.11-4-x86_64.pkg.tar.xz
ARG LANG=en_US.UTF-8

ENV  LANG=${LANG} \
     LANGUAGE=${LANG}:en
#        LC_ALL=en_US.UTF-8

ARG LIBERICA_VERSION=8u442
ARG LIBERICA_BUILD=7
ARG LIBERICA_ROOT=/usr/lib/jvm/jdk-${LIBERICA_VERSION}-bellsoft
ARG LIBERICA_VARIANT=jdk
ARG LIBERICA_USE_LITE=1
ARG LIBERICA_GENERATE_CDS=false

COPY --from=glibc-base /root/dest/ /

RUN LIBERICA_ARCH='' && LIBERICA_ARCH_TAG='' &&    \
  apk --no-cache upgrade libcrypto3 libssl3 &&     \
  case `uname -m` in                               \
        x86_64)                                    \
            LIBERICA_ARCH="amd64"                  \
            ;;                                     \
        i686)                                      \
            LIBERICA_ARCH="i586"                   \
            ;;                                     \
        aarch64)                                   \
            LIBERICA_ARCH="aarch64"                \
            ;;                                     \
        armv[67]l)                                 \
            LIBERICA_ARCH="arm32-vfp-hflt";        \
            ;;                                     \
        *)                                         \
            LIBERICA_ARCH=`uname -m`               \
            ;;                                     \
  esac  &&                                         \
  LITE_VERSION_EXCLUDES="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then LITE_VERSION_EXCLUDES="--exclude=*/demo --exclude=*/sample --exclude=*/src.zip"; fi && \
  ln -s ${GLIBC_PREFIX}/lib/ld-*.so* /lib && \
  ln -s ${GLIBC_PREFIX}/etc/ld.so.cache /etc && \
  if [ "$LIBERICA_ARCH" = "amd64" ]; then ln -s /lib /lib64 && \
  mkdir /tmp/zlib && wget -O - "${EXT_ZLIB_URL}" | tar xJf - -C /tmp/zlib && \
  cp -dP /tmp/zlib/usr/lib/libz.so* "${GLIBC_PREFIX}/lib" && \
  rm -rf /tmp/zlib && \
  mkdir /tmp/gcc && wget -O - "${EXT_GCC_LIBS_URL}" | tar xJf - -C /tmp/gcc && \
  cp -dP /tmp/gcc/usr/lib/libgcc* /tmp/gcc/usr/lib/libstdc++* "${GLIBC_PREFIX}/lib" && \
  rm -rf /tmp/gcc; \
  elif [ "$LIBERICA_ARCH" = "aarch64" ]; then ln -s /lib /lib64 && \
  mkdir /tmp/gcc && wget "${EXT_GCC_LIBS_URL_AARCH64}" -O /tmp/gcc/gcc-libs.tar.xz && \
  echo "${EXT_GCC_LIBS_SHA256_AARCH64} */tmp/gcc/gcc-libs.tar.xz" | sha256sum -c - && \
  tar xJf /tmp/gcc/gcc-libs.tar.xz -C /tmp/gcc && \
  cp -dP /tmp/gcc/usr/lib/libgcc* /tmp/gcc/usr/lib/libstdc++* "${GLIBC_PREFIX}/lib" && \
  rm -rf /tmp/gcc; \
  fi && \
  ${GLIBC_PREFIX}/sbin/ldconfig && \
  apk --no-cache add ttf-dejavu && \
  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' > /etc/nsswitch.conf && \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}.tar.gz"` && \
  echo "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" && \
  wget "https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" -O /tmp/java/jdk.tar.gz && \
  SHA1=`wget -q "https://download.bell-sw.com/sha1sum/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}" -O - | grep ${PKG} | grep -v json | cut -f1 -d' '` && \
  echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jdk.tar.gz -C /tmp/java $LITE_VERSION_EXCLUDES && \
  find "/tmp/java/${LIBERICA_VARIANT}${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  ln -s "${LIBERICA_ROOT}" /usr/lib/jvm/jdk \
  &&  if [ $LIBERICA_GENERATE_CDS = true ]; then                     \
        ${LIBERICA_ROOT}/bin/java -Xshare:dump;                      \
      else                                                           \
        find ${LIBERICA_ROOT} -name "classes*.jsa" -exec rm {} \; ;  \
      fi                           \
  &&  rm -rf /tmp/java             \
  &&  rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
        PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
