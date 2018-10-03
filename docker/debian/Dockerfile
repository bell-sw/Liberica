FROM debian:9 

RUN apt-get update && \
	apt-get install -y curl && \
	rm -rf /var/lib/apt/lists/*

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/opt/liberica
ARG LIBERICA_VERSION=10.0.2
ARG LIBERICA_ARCH=amd64
ARG LIBERICA_VARIANT=jdk

#ENV LIBERICA_ROOT=${LIBERICA_ROOT} \
#    LIBERICA_VERSION=${LIBERICA_VERSION} \
#    LIBERICA_ARCH=${LIBERICA_ARCH} \
#    LIBERICA_VARIANT=${LIBERICA_VARIANT}

RUN mkdir -p $LIBERICA_ROOT && \
	curl -sSL "https://github.com/bell-sw/Liberica/releases/download/${LIBERICA_VERSION}.${LIBERICA_ARCH}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}.tar.gz" | tar xzf - -C $LIBERICA_ROOT

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#RUN sed -i -e "s,\(PATH=\"\),\1${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:," /etc/profile && \
# sed -i -e "s,\(PATH=\),\1${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:,"	/etc/login.defs
