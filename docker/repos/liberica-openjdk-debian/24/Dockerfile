FROM debian:12

RUN     apt-get update                              \
  &&    apt-get install -y curl fontconfig locales  \
  &&    rm -rf /var/lib/apt/lists/*                 \
  && 	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && 	locale-gen                                  \
  &&    apt-get clean

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en

ARG LIBERICA_IMAGE_VARIANT=lite
ARG LIBERICA_VM="server"
ARG LIBERICA_GENERATE_CDS=false

ARG LIBERICA_JVM_DIR=/usr/lib/jvm
ARG LIBERICA_VERSION=24
ARG LIBERICA_BUILD=37
ARG LIBERICA_ROOT=${LIBERICA_JVM_DIR}/jdk-${LIBERICA_VERSION}-bellsoft

ARG BASE_URL="https://download.bell-sw.com/java/"

RUN     LIBERICA_ARCH=''                       \
  &&    set -x                                 \
  &&    LIBERICA_ARCH_TAG=''                   \
  &&    case `uname -m` in                     \
            x86_64)                            \
                LIBERICA_ARCH="amd64"          \
                ;;                             \
            i686)                              \
                LIBERICA_ARCH="i586"           \
                ;;                             \
            aarch64)                           \
                LIBERICA_ARCH="aarch64"        \
                ;;                             \
            armv[67]l)                         \
                LIBERICA_ARCH="arm32-vfp-hflt" \
                ;;                             \
            ppc64le)                           \
                LIBERICA_ARCH="ppc64le"        \
                ;;                             \
            *)                                 \
                LIBERICA_ARCH=`uname -m`       \
                ;;                             \
        esac                                   \
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
  &&    if [ "${LIBERICA_IMAGE_VARIANT}" = "standard" -o "${LIBERICA_IMAGE_VARIANT}" = "lite" ]; then \
          case $LIBERICA_VM in                                                                        \
            server|client|minimal|all) echo ;;                                                        \
            *) echo "Only server, client, minimal or all VM is avalable for LIBERICA_VM argument"     \
  &&           echo "example: LIBERICA_VM='server'"                                                   \
  &&           exit 1                                                                                 \
             ;; \
          esac  \
        fi      \
  &&    mkdir -p /tmp/java \
  &&    LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} \
  &&    DIST_URL=${BASE_URL}/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}${LITE_URL} \
  &&    PKG="bellsoft-jdk${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${RSUFFIX}.tar.gz" \
  &&    PKG_URL="${DIST_URL}/${PKG}"         \
  &&    echo "download ${PKG_URL}:" \
  &&    curl -SL "${PKG_URL}" -o /tmp/java/jdk.tar.gz \
  &&    SHA_URL="${DIST_URL}/sha1sum.txt" \
  &&    if [ "${LIBERICA_IMAGE_VARIANT}" = "standard" ]; then                                                    \
          SHA_URL="https://download.bell-sw.com/sha1sum/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}";         \
        fi \
  &&    SHA1=$(curl -fSL "${SHA_URL}"             \
               | grep ${PKG} | grep -v json       \
               | cut -f1 -d' '                    \
              )                                   \
  &&    echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - \
  &&    tar xzf /tmp/java/jdk.tar.gz -C /tmp/java \
  &&    UNPACKED_ROOT=/tmp/java/jdk-${LIBERICA_VERSION}*    \
  &&    case "$LIBERICA_IMAGE_VARIANT" in                   \
            base)                                           \
                apt-get update                              \
  &&            apt-get install -y binutils                 \
  &&            mkdir -pv "${LIBERICA_JVM_DIR}"             \
  &&            ${UNPACKED_ROOT}/bin/jlink                  \
                    --add-modules java.base                 \
                    --compress=zip-9                            \
                    --no-header-files                       \
                    --no-man-pages --strip-debug            \
                    --module-path ${UNPACKED_ROOT}/jmods    \
                    --vm=server                             \
                    --release-info ${UNPACKED_ROOT}/release \
                    --output "${LIBERICA_ROOT}"             \
  &&            apt-get remove --auto-remove -y binutils ;; \
            base-minimal)                                   \
                apt-get update                              \
  &&            apt-get install -y binutils                 \
  &&            mkdir -pv "${LIBERICA_JVM_DIR}"             \
  &&            ${UNPACKED_ROOT}/bin/jlink                  \
                    --add-modules java.base                 \
                    --compress=zip-9                            \
                    --no-header-files                       \
                    --no-man-pages --strip-debug            \
                    --module-path ${UNPACKED_ROOT}/jmods    \
                    --vm=minimal                            \
                    --release-info ${UNPACKED_ROOT}/release \
                    --output "${LIBERICA_ROOT}"             \
  &&            apt-get remove --auto-remove -y binutils ;; \
            standard)                                       \
                mkdir -pv "${LIBERICA_ROOT}"                \
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
                ;;                                        \
            *)                                              \
                MODS=$( ls ${UNPACKED_ROOT}/jmods/          \
                      | sed "s/.jmod//"                     \
                      | grep -v javafx                      \
                      | tr '\n' ', '                        \
                      | sed "s/,$//")                       \
  &&            mkdir -pv "${LIBERICA_JVM_DIR}"             \
  &&            apt-get update                              \
  &&            apt-get install -y binutils                 \
  &&            ${UNPACKED_ROOT}/bin/jlink                  \
                    --add-modules ${MODS}                   \
                    --compress=zip-9                            \
                    --no-man-pages                          \
                    --module-path ${UNPACKED_ROOT}/jmods    \
                    --vm=${LIBERICA_VM}                     \
                    --release-info ${UNPACKED_ROOT}/release \
                    --output "${LIBERICA_ROOT}"             \
  &&            apt-get remove --auto-remove -y binutils    \
                ;;                                        \
        esac                                              \
  &&    apt-get -y autoremove                             \
  &&    apt-get -y autoclean                              \
  &&    apt-get clean                                     \
  &&    ln -s $LIBERICA_ROOT /usr/lib/jvm/jdk             \
  &&    if [ $LIBERICA_GENERATE_CDS = true ]; then                       \
        ${LIBERICA_ROOT}/bin/java -XX:+UseCompressedOops -Xshare:dump;   \
        ${LIBERICA_ROOT}/bin/java -XX:-UseCompressedOops -Xshare:dump;   \
    else                                                                 \
        find ${LIBERICA_ROOT} -name "classes*.jsa" -exec rm {} \; ;      \
    fi                               \
  &&    rm -rf /tmp/java             \
  &&    rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

