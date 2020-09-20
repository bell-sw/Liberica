FROM alpine:3.11 as liberica

### Modify argument LIBERICA_IMAGE_VARIANT or redefine it via --build-arg parameter to have specific liberica image installed:
###    docker build . --build-arg LIBERICA_IMAGE_VARIANT=[full|lite|base]
### base: minimal image with compressed java.base module, Server VM and optional files stripped, ~37 MB with Alpine base
### lite: lite image with minimal footprint and Server VM, ~ 100 MB
### full: full jdk image with Server VM and jmods, can be used to create arbirary module set, ~180 MB

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_IMAGE_VARIANT=lite

ARG LIBERICA_JVM_DIR=/usr/lib/jvm
ARG LIBERICA_ROOT=${LIBERICA_JVM_DIR}/jdk-15-bellsoft
ARG LIBERICA_VERSION=15
ARG LIBERICA_BUILD=36
ARG LIBERICA_VARIANT=jdk
ARG LIBERICA_RELEASE_TAG=
ARG LIBERICA_ARCH=x64
ARG LIBERICA_GLIBC=no

ARG OPT_PKGS=

RUN RTAG="$LIBERICA_RELEASE_TAG" && if [ "x${RTAG}" = "x" ]; then RTAG="$LIBERICA_VERSION"; fi && \
  RSUFFIX="" && if [ "$LIBERICA_IMAGE_VARIANT" = "lite" ]; then RSUFFIX="-lite"; fi && \
  LIBSUFFIX="" && if [ "$LIBERICA_GLIBC" = "no" ]; then LIBSUFFIX="-musl"; fi && \
  for pkg in $OPT_PKGS ; do apk --no-cache add $pkg ; done && \
  mkdir -p /tmp/java && \
  LIBERICA_BUILD_STR=${LIBERICA_BUILD:+"+${LIBERICA_BUILD}"} && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}${LIBERICA_BUILD_STR}-linux-${LIBERICA_ARCH}${LIBSUFFIX}${RSUFFIX}.tar.gz"` && \
  PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}/${PKG}" && \
  echo "Download ${PKG_URL}" && \
  wget "${PKG_URL}" -O /tmp/java/jdk.tar.gz && \
  SHA1=`wget -q "https://download.bell-sw.com/sha1sum/java/${LIBERICA_VERSION}${LIBERICA_BUILD_STR}" -O - | grep ${PKG} | cut -f1 -d' '` && \
  echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jdk.tar.gz -C /tmp/java && \
  UNPACKED_ROOT="/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" && \
  if [ "$LIBERICA_IMAGE_VARIANT" = "lite" ]; then mkdir -pv "${LIBERICA_ROOT}" && find /tmp/java/${LIBERICA_VARIANT}* -maxdepth 1 -mindepth 1 -exec mv -v "{}" "${LIBERICA_ROOT}/" \; ; fi && \
  if [ "$LIBERICA_IMAGE_VARIANT" = "base" ]; then apk add binutils && mkdir -pv "${LIBERICA_JVM_DIR}" && "${UNPACKED_ROOT}/bin/jlink" --add-modules java.base --compress=2 --no-header-files --no-man-pages --strip-debug --module-path \
    "${UNPACKED_ROOT}"/jmods --vm=server --output "${LIBERICA_ROOT}" && apk del binutils; fi && \
  if [ "$LIBERICA_IMAGE_VARIANT" = "full" ]; then mkdir -pv "${LIBERICA_JVM_DIR}" && MODS=`ls "${UNPACKED_ROOT}/jmods/" | sed "s/.jmod//" | grep -v javafx | tr '\n' ', ' | sed "s/,$//"` && \
    "${UNPACKED_ROOT}/bin/jlink" --add-modules "${MODS}" --module-path "${UNPACKED_ROOT}/jmods" --vm=server --output "${LIBERICA_ROOT}"; fi && \
  ln -s $LIBERICA_ROOT /usr/lib/jvm/jdk && \
  rm -rf /tmp/java && rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

