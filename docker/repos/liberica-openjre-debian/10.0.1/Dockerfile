FROM debian:9 

RUN apt-get update && \
	apt-get install -y curl && \
	rm -rf /var/lib/apt/lists/*

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/usr/lib/jvm/jre-10.0.1-bellsoft
ARG LIBERICA_VERSION=10.0.1
ARG LIBERICA_VARIANT=jre

RUN LIBERICA_ARCH='' && LIBERICA_ARCH_TAG='' && \
  case `uname -m` in \
        x86_64) \
            LIBERICA_ARCH="amd64" \
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
  curl -SL "https://github.com/bell-sw/Liberica/releases/download/${LIBERICA_VERSION}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}.tar.gz" | \
    tar xzf - -C /tmp/java && \
  find "/tmp/java/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" -maxdepth 1 -mindepth 1 -exec mv "{}" "${LIBERICA_ROOT}/" \; && \
  rm -rf /tmp/java

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#RUN sed -i -e "s,\(PATH=\"\),\1${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:," /etc/profile && \
# sed -i -e "s,\(PATH=\),\1${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:,"	/etc/login.defs
