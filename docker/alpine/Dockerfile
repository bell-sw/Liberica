FROM debian:stable-slim as glibc-base

ARG GLIBC_VERSION=2.28
ARG GLIBC_PREFIX=/usr/glibc

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
  cd /root && rm -rf build glibc-${GLIBC_VERSION} && \
  cd /root/dest${GLIBC_PREFIX} && \
  ( strip bin/* sbin/* lib/* || true )

RUN cd /root/dest${GLIBC_PREFIX} && \
  rm -rf etc/rpc var include share bin sbin/[^l]*  \
	lib/*.o lib/*.a lib/audit lib/gconv lib/getconf

#sbin/[^l]*

FROM alpine:3.8 as liberica

ARG GLIBC_PREFIX=/usr/glibc

ENV  LANG=en_US.UTF-8 \
     LANGUAGE=en_US:en
#	 LC_ALL=en_US.UTF-8

ARG LIBERICA_ROOT=/opt/liberica
ARG LIBERICA_VERSION=10.0.2
ARG LIBERICA_ARCH=amd64
ARG LIBERICA_ARCH_TAG=amd64
ARG LIBERICA_VARIANT=jdk

COPY --from=glibc-base /root/dest/ /

RUN ln -s ${GLIBC_PREFIX}/lib/ld-linux-*.so.* /lib && \
  ln -s ${GLIBC_PREFIX}/etc/ld.so.cache /etc && \
  ( [ "$LIBERICA_ARCH" = "amd64" ] && ln -s /lib /lib64 || true ) && \
  echo "/usr/local/lib" > ${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "${GLIBC_PREFIX}/lib" > ${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/usr/lib" > ${GLIBC_PREFIX}/etc/ld.so.conf && \
  echo "/lib" > ${GLIBC_PREFIX}/etc/ld.so.conf && \
  ${GLIBC_PREFIX}/sbin/ldconfig && \
  \
  mkdir -p $LIBERICA_ROOT && \
  wget -O - "https://github.com/bell-sw/Liberica/releases/download/${LIBERICA_VERSION}.${LIBERICA_ARCH_TAG}/bellsoft-${LIBERICA_VARIANT}${LIBERICA_VERSION}-linux-${LIBERICA_ARCH}.tar.gz" | tar xzf - -C $LIBERICA_ROOT && \
  if [ "$LIBERICA_VARIANT" = "jdk" ]; then \
    ls /opt/liberica/jdk-10.0.2/jmods/ | sed 's/\.[^.]*$//' | xargs | sed 's/ /,/g' | xargs \
	  ${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin/jlink --compress 2 --module-path ${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/jmods/ --output  ${LIBERICA_ROOT}/jdk-min --add-modules && \
   rm -rf "${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}" && \
   mv  "${LIBERICA_ROOT}/jdk-min" "${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}"; \
  fi

ENV JAVA_HOME=${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION} \
	PATH=${LIBERICA_ROOT}/${LIBERICA_VARIANT}-${LIBERICA_VERSION}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
