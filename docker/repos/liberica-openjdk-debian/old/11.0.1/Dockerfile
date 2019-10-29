FROM debian:9

RUN apt-get update && \
	apt-get install -y curl && \
	rm -rf /var/lib/apt/lists/*

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/usr/lib/jvm/jdk-11.0.1-bellsoft
ARG LIBERICA_VERSION=11.0.1
ARG LIBERICA_VARIANT=jdk
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
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  RSUFFIX="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then RSUFFIX="-lite"; fi && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}${RSUFFIX}.tar.gz"` && \
  PKG_URL="https://download.bell-sw.com/java/${LIBERICA_VERSION}/${PKG}" && \
  echo "Download ${PKG_URL}" && \
  curl -SL "${PKG_URL}" -o /tmp/java/jdk.tar.gz && \
  SHA1=`curl -fSL "https://download.bell-sw.com/sha1sum/java/${LIBERICA_VERSION}" | grep ${PKG} | cut -f1 -d' '` && \
  echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jdk.tar.gz -C /tmp/java && \
  find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  rm -rf /tmp/java

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

