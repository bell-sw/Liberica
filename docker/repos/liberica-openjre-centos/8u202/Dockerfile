FROM centos:7

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/usr/lib/jvm/jre-8u202-bellsoft
ARG LIBERICA_VERSION=8u202
ARG LIBERICA_VARIANT=jre
ARG LIBERICA_RELEASE_TAG=
ARG LIBERICA_USE_LITE=1

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
            LIBERICA_ARCH="arm32-vfp-hflt" \
            ;; \
        *) \
            LIBERICA_ARCH=`uname -m` \
            ;; \
  esac  && \
  RTAG="$LIBERICA_RELEASE_TAG" && if [ "x${RTAG}" = "x" ]; then RTAG="$LIBERICA_VERSION"; fi && \
  curl -sfI "https://github.com/bell-sw/Liberica/releases/download/${RTAG}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}-fx.bom" && \
  FX_EXCLUDES="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then FX_EXCLUDES=`curl -SL "https://github.com/bell-sw/Liberica/releases/download/${RTAG}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}-fx.bom" | sed -e 's/^\(.*\)/--exclude \1/g' | tr '\n' ' '`; fi && \
  LITE_VERSION_EXCLUDES="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then LITE_VERSION_EXCLUDES="--exclude=demo --exclude=sample --exclude=src.zip ${FX_EXCLUDES}"; fi && \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  curl -SL "https://github.com/bell-sw/Liberica/releases/download/${RTAG}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}.tar.gz" | \
  tar xzf - -C /tmp/java $LITE_VERSION_EXCLUDES && \
  find "/tmp/java/${LIBERICA_VARIANT}${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  rm -rf /tmp/java


ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
