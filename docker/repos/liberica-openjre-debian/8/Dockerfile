FROM debian:12

RUN     apt-get update                              \
  &&    apt-get install -y curl fontconfig locales  \
  &&    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  &&    locale-gen                                  \
  &&    apt-get clean                               \
  &&    apt-get -y autoclean                        \
  &&    apt-get -y autoremove                       \
  &&    rm -rf /var/lib/apt/lists/*

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8


ARG LIBERICA_VERSION=8u432
ARG LIBERICA_BUILD=7
ARG LIBERICA_VARIANT=jre
ARG LIBERICA_ROOT=/usr/lib/jvm/jre-${LIBERICA_VERSION}-bellsoft
ARG LIBERICA_USE_LITE=1
ARG LIBERICA_GENERATE_CDS=false

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
  LITE_VERSION_EXCLUDES="" && if [ "$LIBERICA_USE_LITE" = "1" ]; then \
  LITE_VERSION_EXCLUDES="--exclude ${PACKED_ROOT}/demo --exclude ${PACKED_ROOT}/sample --exclude ${PACKED_ROOT}/src.zip --exclude ${PACKED_ROOT}/man"; fi && \
  mkdir -p $LIBERICA_ROOT && \
  mkdir -p /tmp/java && \
  PKG=`echo "bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}+${LIBERICA_BUILD}-linux-${LIBERICA_ARCH}.tar.gz"` && \
  curl -SL "https://download.bell-sw.com/java/${LIBERICA_VERSION}+${LIBERICA_BUILD}/${PKG}" -o /tmp/java/jdk.tar.gz && \
  SHA1=`curl -fSL "https://download.bell-sw.com/sha1sum/java/${LIBERICA_VERSION}+${LIBERICA_BUILD}" | grep ${PKG} | grep -v json | cut -f1 -d' '` && \
  echo "${SHA1} */tmp/java/jdk.tar.gz" | sha1sum -c - && \
  tar xzf /tmp/java/jdk.tar.gz -C /tmp/java $LITE_VERSION_EXCLUDES && \
  find "/tmp/java/${LIBERICA_VARIANT}${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  ln -s "${LIBERICA_ROOT}" /usr/lib/jvm/jre \
  &&  if [ $LIBERICA_GENERATE_CDS = true ]; then                     \
        ${LIBERICA_ROOT}/bin/java -Xshare:dump;                      \
      else                                                           \
        find ${LIBERICA_ROOT} -name "classes*.jsa" -exec rm {} \; ;  \
      fi                           \
  &&  rm -rf /tmp/java             \
  &&  rm -rf /tmp/hsperfdata_root

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


