FROM debian:10-slim as glibc-base

ARG GLIBC_VERSION=2.28
ARG GLIBC_PREFIX=/usr/glibc
ARG LANG=en_US.UTF-8

RUN     apt-get update \
  &&    apt-get install -y curl build-essential gawk bison python3 texinfo gettext \
  &&    cd /root \
  &&    curl -SL http://ftp.gnu.org/gnu/glibc/glibc-${GLIBC_VERSION}.tar.gz | tar xzf - \
  &&    mkdir -p /root/build \
  &&    cd /root/build \
  &&    ../glibc-${GLIBC_VERSION}/configure \
          --prefix=${GLIBC_PREFIX} \
          --libdir="${GLIBC_PREFIX}/lib" \
          --libexecdir="${GLIBC_PREFIX}/lib" \
          --enable-multi-arch \
          --enable-stack-protector=strong \
  &&    make -j`nproc` \
  &&    make DESTDIR=/root/dest install \
  &&    RTLD=`find /root/dest${GLIBC_PREFIX}/lib -name 'ld-linux-*.so.*'` \
  &&    [ -x "$RTLD" ] \
  &&    LOCALEDEF="$RTLD --library-path /root/dest${GLIBC_PREFIX}/lib /root/dest${GLIBC_PREFIX}/bin/localedef --alias-file=/root/glibc-${GLIBC_VERSION}/intl/locale.alias" \
  &&    export I18NPATH=/root/glibc-${GLIBC_VERSION}/localedata \
  &&    export GCONVPATH=/root/glibc-${GLIBC_VERSION}/iconvdata \
  &&    LOCALE=$(echo ${LANG} | cut -d. -f1) \
  &&    CHARMAP=$(echo ${LANG} | cut -d. -f2) \
  &&    mkdir -pv /root/dest${GLIBC_PREFIX}/lib/locale \
  &&    cd /root/glibc-${GLIBC_VERSION}/localedata \
  &&    ${LOCALEDEF} -i locales/$LOCALE -f charmaps/$CHARMAP --prefix=/root/dest $LANG \
  &&    cd /root \
  &&    rm -rf build glibc-${GLIBC_VERSION} \
  &&    cd /root/dest${GLIBC_PREFIX} \
  &&    ( strip bin/* sbin/* lib/* || true ) \
  &&    echo "/usr/local/lib" > /root/dest${GLIBC_PREFIX}/etc/ld.so.conf \
  &&    echo "${GLIBC_PREFIX}/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf \
  &&    echo "/usr/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf \
  &&    echo "/lib" >> /root/dest${GLIBC_PREFIX}/etc/ld.so.conf

RUN cd /root/dest${GLIBC_PREFIX} && \
  rm -rf etc/rpc var include share bin sbin/[^l]*  \
	lib/*.o lib/*.a lib/audit lib/gconv lib/getconf

FROM alpine:3.16 as liberica

ARG GLIBC_PREFIX=/usr/glibc
ARG EXT_GCC_LIBS_URL=https://archive.archlinux.org/packages/g/gcc-libs/gcc-libs-8.3.0-1-x86_64.pkg.tar.xz
ARG EXT_ZLIB_URL=https://archive.archlinux.org/packages/z/zlib/zlib-1%3A1.2.11-3-x86_64.pkg.tar.xz
ARG LANG=en_US.UTF-8
ARG OPT_PKGS=

ENV  LANG=${LANG} \
     LANGUAGE=${LANG}:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_IMAGE_VARIANT=lite
ARG LIBERICA_VM="server"

ARG LIBERICA_JVM_DIR=/usr/lib/jvm
ARG LIBERICA_VERSION=11.0.15
ARG LIBERICA_BUILD=10

ARG LIBERICA_ROOT=${LIBERICA_JVM_DIR}/jdk-${LIBERICA_VERSION}-bellsoft

COPY --from=glibc-base /root/dest/ /

RUN LIBERICA_ARCH=''                               \
  && set -x                                        \
  &&    case `uname -m` in                         \
            x86_64)                                \
                LIBERICA_ARCH="amd64"              \
                ;;                                 \
            i686)                                  \
                LIBERICA_ARCH="i586"               \
                ;;                                 \
            aarch64)                               \
                LIBERICA_ARCH="aarch64"            \
                ;;                                 \
            armv[67]l)                             \
                LIBERICA_ARCH="arm32-vfp-hflt";    \
                ;;                                 \
            ppc64le)                               \
                LIBERICA_ARCH="ppc64le";           \
                ;;                                 \
            *)                                     \
                LIBERICA_ARCH=`uname -m`           \
                ;;                                 \
        esac                                       \
  &&    ln -s ${GLIBC_PREFIX}/lib/ld-*.so* /lib                   \
  &&    ln -s ${GLIBC_PREFIX}/etc/ld.so.cache /etc                \
  &&    if [ "$LIBERICA_ARCH" = "amd64" ]; then                   \
          ln -s /lib /lib64                                       \
  &&      mkdir /tmp/zlib                                         \
  &&      wget -O - "${EXT_ZLIB_URL}" | tar xJf - -C /tmp/zlib    \
  &&      cp -dP /tmp/zlib/usr/lib/libz.so* "${GLIBC_PREFIX}/lib" \
  &&      rm -rf /tmp/zlib                                        \
  &&      mkdir /tmp/gcc                                          \
  &&      wget -O - "${EXT_GCC_LIBS_URL}" | tar xJf - -C /tmp/gcc \
  &&      cp -dP /tmp/gcc/usr/lib/libgcc* /tmp/gcc/usr/lib/libstdc++* "${GLIBC_PREFIX}/lib" \
  &&      rm -rf /tmp/gcc;     \
        fi                     \
  &&    for pkg in $OPT_PKGS ; do apk --no-cache add $pkg ; done \
  &&    ${GLIBC_PREFIX}/sbin/ldconfig                            \
  &&    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' > /etc/nsswitch.conf \
  &&    case "$LIBERICA_IMAGE_VARIANT" in                                   \
            standard)                                                       \
                RSUFFIX=""                                                  \
  &&            LITE_URL="" ;;                                              \
            lite|base|base-minimal)                                         \
                RSUFFIX="-lite"                                             \
  &&            LITE_URL="/docker" ;;                                       \
            *) echo "Invalid parameter LIBERICA_IMAGE_VARIANT = ${LIBERICA_IMAGE_VARIANT}"    \
  &&           echo "LIBERICA_IMAGE_VARIANT can be one of [standard|lite|base|base-minimal]"  \
  &&           exit 1 ;; \
         esac            \
  &&  if [[ ${LIBERICA_IMAGE_VARIANT} == "standard" || ${LIBERICA_IMAGE_VARIANT} == "lite" ]]; then \
        case $LIBERICA_VM in                                                                        \
          server|client|minimal|all) echo ;;                                                        \
          *) echo "Only server, client, minimal or all VM is avalable for LIBERICA_VM argument"     \
  &&            echo "example: LIBERICA_VM='server'"                                                \
  &&            exit 1                                                                              \
           ;; \
        esac; \
      fi      \
  &&    for pkg in $OPT_PKGS ; do apk --no-cache add $pkg ; done            \
  &&    mkdir -p /tmp/java                                                  \
  &&    LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"}          \
  &&    PKG="bellsoft-jdk${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${RSUFFIX}.tar.gz" \
  &&    PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}${LITE_URL}/${PKG}"         \
  &&    echo "Download ${PKG_URL}"                                                                   \
  &&    wget "${PKG_URL}" -O /tmp/java/jdk.tar.gz                                                    \
  &&    SHA_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/docker/sha1sum.txt" \
  &&    if [ ${LIBERICA_IMAGE_VARIANT} == "standard" ]; then                                                    \
          SHA_URL="https://download.bell-sw.com/sha1sum/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}";         \
        fi \
  &&    SHA1=$(wget -q "${SHA_URL}" -O -          \
               | grep ${PKG}                      \
               | cut -f1 -d' '                    \
              )                                   \
  &&    echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - \
  &&    tar xzf /tmp/java/jdk.tar.gz -C /tmp/java           \
  &&    UNPACKED_ROOT=/tmp/java/jdk-${LIBERICA_VERSION}*    \
  &&    case $LIBERICA_IMAGE_VARIANT in                     \
            base)                                           \
                apk --no-cache add binutils                 \
  &&            mkdir -pv "${LIBERICA_JVM_DIR}"             \
  &&            ${UNPACKED_ROOT}/bin/jlink                  \
                    --add-modules java.base                 \
                    --compress=2                            \
                    --no-header-files                       \
                    --no-man-pages --strip-debug            \
                    --module-path ${UNPACKED_ROOT}/jmods    \
                    --vm=server                             \
                    --release-info ${UNPACKED_ROOT}/release \
                    --output "${LIBERICA_ROOT}"             \
  &&            apk del binutils ;;                         \
            base-minimal)                                   \
                apk --no-cache add binutils                 \
  &&            mkdir -pv "${LIBERICA_JVM_DIR}"             \
  &&            ${UNPACKED_ROOT}/bin/jlink                  \
                    --add-modules java.base                 \
                    --compress=2                            \
                    --no-header-files                       \
                    --no-man-pages --strip-debug            \
                    --module-path ${UNPACKED_ROOT}/jmods    \
                    --release-info ${UNPACKED_ROOT}/release \
                    --vm=minimal                            \
                    --output "${LIBERICA_ROOT}"             \
  &&            apk del binutils ;;                         \
            standard)                                       \
                apk --no-cache add binutils                 \
  &&            mkdir -pv "${LIBERICA_ROOT}"                \
  &&            find /tmp/java/jdk*                         \
                    -maxdepth 1 -mindepth 1                 \
                    -exec                                   \
                      mv -v "{}" "${LIBERICA_ROOT}/" \;     \
  &&            case ${LIBERICA_VM} in                    \
                  client)                                 \
                    rm -rf ${LIBERICA_ROOT}/lib/server    \
  &&                rm -rf ${LIBERICA_ROOT}/lib/minimal   \
  &&                echo "-client KNOWN"                  \
                      >  ${LIBERICA_ROOT}/lib/jvm.cfg     \
  &&                echo "-server ALIASED_TO -client"     \
                      >> ${LIBERICA_ROOT}/lib/jvm.cfg     \
                  ;;                                      \
                  server)                                 \
                    rm -rf ${LIBERICA_ROOT}/lib/client    \
  &&                rm -rf ${LIBERICA_ROOT}/lib/minimal   \
  &&                echo "-server KNOWN"                  \
                      >  ${LIBERICA_ROOT}/lib/jvm.cfg     \
  &&                echo "-client ALIASED_TO -server"     \
                      >> ${LIBERICA_ROOT}/lib/jvm.cfg     \
                  ;;                                      \
                  minimal)                                \
                    ([ ! -f ${LIBERICA_ROOT}/lib/minimal ]\
  &&                  echo "Standard Liberica JDK does not have minimal VM" \
  &&                  exit 1 )                            \
  &&                rm -rf ${LIBERICA_ROOT}/lib/server    \
  &&                rm -rf ${LIBERICA_ROOT}/lib/minimal   \
  &&                echo "-minimal KNOWN"                 \
                      >  ${LIBERICA_ROOT}/lib/jvm.cfg     \
  &&                echo "-client ALIASED_TO -minimal"    \
                      >> ${LIBERICA_ROOT}/lib/jvm.cfg     \
  &&                echo "-client ALIASED_TO -minimal"    \
                      >> ${LIBERICA_ROOT}/lib/jvm.cfg     \
                  ;;                                      \
                  all) echo ;;                            \
                  *) echo "Unknows LIBERICA_VM value \"${LIBERICA_VM}\"" \
  &&                 exit 1 ;;                            \
                esac                                      \
  &&            apk del binutils ;;                       \
            *)                                              \
                MODS=$( ls ${UNPACKED_ROOT}/jmods/          \
                      | sed "s/.jmod//"                     \
                      | grep -v javafx                      \
                      | tr '\n' ', '                        \
                      | sed "s/,$//")                       \
  &&            apk --no-cache add binutils                 \
  &&            mkdir -pv "${LIBERICA_JVM_DIR}"             \
  &&            ${UNPACKED_ROOT}/bin/jlink                  \
                    --add-modules ${MODS}                   \
                    --compress=2                            \
                    --no-man-pages                          \
                    --module-path ${UNPACKED_ROOT}/jmods    \
                    --vm=${LIBERICA_VM}                     \
                    --release-info ${UNPACKED_ROOT}/release \
                    --output "${LIBERICA_ROOT}"             \
  &&            apk del binutils ;;                         \
        esac                                                \
  &&    ln -s $LIBERICA_ROOT /usr/lib/jvm/jdk               \
  &&    rm -rf /tmp/java                                    \
  &&    rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
