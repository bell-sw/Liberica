#!/bin/bash
set -x
set -e
# Usage - build.sh $PUSH $PUSH_MANIFEST $DO_BUILD
#   Where parameters are 0 or 1.

die() {
  echo "Error!"
  echo "$@"
  exit 1
}

getTags() {
  repo="$1"
  pattern="$2"
  tags=$(curl -sSL https://registry.hub.docker.com/v1/repositories/${repo}/tags |\
        sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' |\
        tr '}' '\n' |\
        awk -F: '{print $3}' |\
        grep -E -- "${pattern}") || exit 1
   echo ${tags}
}

waitForTag() {
  image=$1
  tag=$2
  url=https://registry.hub.docker.com/v1/repositories/${image}/tags
  timeout=60
  passed=0
  while true ; do
    if curl -sSL ${url} | grep -q ${tag} ; then
      return
    fi
    sleep 5
    passed=$((passed+5))
    [[ ${passed} -gt ${timeout} ]] && die "Unable to get expected tag \"${tag}\" from \"${url}\"."
  done
}

execDockerCmd() {
  echo "---------- Run docker command ----------"
  echo docker "$@"
  docker "$@" || die "Failed execute docker command"
}

PUSH=$1
[[ -z ${PUSH} ]] && PUSH="0"

PUSH_MANIFEST=$2
[[ -z ${PUSH_MANIFEST} ]] && PUSH_MANIFEST="0"

DO_BUILD=$3
[[ -z ${DO_BUILD} ]] && DO_BUILD="1"

NS=bellsoft
ARCH=`uname -m`

[[ -z "$LIBERICA_VERSION" ]] && LIBERICA_VERSION="11 11:11.0.0 11:latest"
[[ -z "$LIBERICA_VARIANT" ]] && LIBERICA_VARIANT="jdk"
[[ -z "$LIBERICA_OS" ]] && LIBERICA_OS="debian centos alpine alpine-musl"
[[ -z "$LIBERICA_RELEASE_TAG" ]] && LIBERICA_RELEASE_TAG=""
[[ -z "$LIBERICA_USE_LITE" ]] && LIBERICA_USE_LITE=""

for os in ${LIBERICA_OS}; do
  for version in ${LIBERICA_VERSION}; do
    for variant in ${LIBERICA_VARIANT}; do
      DOCKER_REPOSITORY=${NS}/liberica-open${variant}-${os}
      TAG=${version}
      V=${version}
      ( echo "$version" | grep -q -- ':' ) &&\
        TAG=$(echo "$version" | cut -d: -f2) &&\
        V=$(echo "$version" | cut -d: -f1 | cut -f 1 -d\+) &&\
        BUILD=$(echo "$version" | cut -d: -f1 | cut -sf 2 -d\+)

      major=$(echo ${V} | sed -e 's,\([1-9][0-9]*\).*,\1,')
      BUILD_PATH="./repos/liberica-open${variant}-$os/${major}"

      [[ ! -d ${BUILD_PATH} ]] && echo "Skipping target: ${variant}-${os}" && continue

      RELEASE_TAG="$LIBERICA_RELEASE_TAG"
      [[ -z ${RELEASE_TAG} ]] && RELEASE_TAG="$V"

      # Skip some configurations
      if [[ "$os" = "alpine-musl" ]] && ([[ "$ARCH" = "aarch64" ]] || [[ "$ARCH" = "armv7l" ]]) ; then
        continue
      fi

      if [[ "$DO_BUILD" = "1" ]]; then
        EXTRA_ARGS=
        if [[ "$os" = "alpine" ]]; then
          #Add some caching
          execDockerCmd build --pull -t ${NS}/glibc-cache --target glibc-base --cache-from ${NS}/glibc-cache ${BUILD_PATH}
          EXTRA_ARGS="--cache-from ${NS}/glibc-cache --cache-from ${DOCKER_REPOSITORY}:$V --cache-from ${DOCKER_REPOSITORY}"
          if [[ "$TAG" != "$V" ]]; then
            EXTRA_ARGS="$EXTRA_ARGS --cache-from ${DOCKER_REPOSITORY}:$TAG"
          fi
        fi

        if [[ "x$LIBERICA_USE_LITE" != "x" ]]; then
          EXTRA_ARGS="$EXTRA_ARGS --build-arg LIBERICA_USE_LITE=${LIBERICA_USE_LITE}"
        fi
        echo "Building Liberica $variant v $version based on ${os}..."
        execDockerCmd build --pull -t ${DOCKER_REPOSITORY}:${TAG} \
          --build-arg LIBERICA_RELEASE_TAG="$RELEASE_TAG" \
          --build-arg LIBERICA_VERSION="$V" \
          --build-arg LIBERICA_BUILD="$BUILD" \
          --build-arg LIBERICA_VARIANT="$variant" \
          --build-arg LIBERICA_ROOT="/usr/lib/jvm/${variant}-${V}-bellsoft-${ARCH}" \
          ${EXTRA_ARGS} \
          ${BUILD_PATH}
        fi

      if [[ "$PUSH" = "1" ]]; then
        execDockerCmd tag  ${DOCKER_REPOSITORY}:${TAG} ${DOCKER_REPOSITORY}:${TAG}-${ARCH}
        execDockerCmd push ${DOCKER_REPOSITORY}:${TAG}-${ARCH}
      fi

      if [[ "$PUSH_MANIFEST" = "1" ]]; then
        waitForTag ${DOCKER_REPOSITORY} ${TAG}-${ARCH}
        tags=$(getTags ${DOCKER_REPOSITORY} "^$TAG-[a-zA-Z]") || die "Cannot find tag matching \"^$TAG-[a-zA-Z]\" in repo \"${DOCKER_REPOSITORY}\""
        images=""
        for tag in ${tags}; do
          images="$images ${DOCKER_REPOSITORY}:$tag"
          #docker pull "${DOCKER_REPOSITORY}:$tag"
        done
        if [[ -n "$images" ]]; then
          #We do push first as it's only way to purge local manifest for now
          execDockerCmd manifest push -p ${DOCKER_REPOSITORY}:${TAG} || true
          execDockerCmd manifest create ${DOCKER_REPOSITORY}:${TAG} ${images}
          execDockerCmd manifest push -p ${DOCKER_REPOSITORY}:${TAG}
        fi
      else
        echo "DO NOT PUSH MANIFEST!"
      fi

    done
  done
done

