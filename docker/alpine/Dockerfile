FROM frolvlad/alpine-glibc:alpine-3.8

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/opt/liberica
ARG LIBERICA_VERSION=10.0.2
ARG LIBERICA_ARCH=amd64
ARG LIBERICA_ARCH_TAG=amd64
ARG LIBERICA_VARIANT=jdk

RUN mkdir -p $LIBERICA_ROOT && \
	wget -O - "https://github.com/bell-sw/Liberica/releases/download/${LIBERICA_VERSION}.${LIBERICA_ARCH_TAG}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}.tar.gz" | tar xzf - -C $LIBERICA_ROOT

ENV JAVA_HOME=${LIBERICA_ROOT} \
	PATH=${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
