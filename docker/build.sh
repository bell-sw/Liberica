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
  if [[ -z $EXTERNAL_API_UTILITY ]]; then
    tags=$(curl -sSL https://registry.hub.docker.com/v2/namespaces/${NS}/repositories/${repo}/tags?page_size=100 |
        tr '}' "\n" |
        grep \"name\" |
        tr "," "\n" |
        grep \"name\" |
        awk -F: '{print $2}' |
        tr -d \" |
        grep -E -- "${pattern}") || exit 1
     echo ${tags} > tags.txt
  else
    rm -rf tags.txt
    TOKEN_OPTS=
    if [[ ! -z $DOCKERHUB_TOKEN ]]; then
      TOKEN_OPTS="--token ${DOCKERHUB_TOKEN}"
    fi
    python3 ${EXTERNAL_API_UTILITY} --api-type dockerhub --action tags -r tags.txt --container-name ${repo} --namespace ${NS} ${TOKEN_OPTS}
    tags=$(cat tags.txt | grep -E -- "${pattern}") || exit 1
    echo ${tags} > tags.txt
  fi
}

waitForTag() {
  image=$1
  tag=$2
  if [[ -z $EXTERNAL_API_UTILITY ]]; then
    url="https://registry.hub.docker.com/v2/namespaces/${NS}/repositories/${image}/tags?page_size=100"
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
  else
    TOKEN_OPTS=
    if [[ ! -z $DOCKERHUB_TOKEN ]]; then
      TOKEN_OPTS="--token ${DOCKERHUB_TOKEN}"
    fi
    
    python3 ${EXTERNAL_API_UTILITY} --api-type dockerhub --action wait-tag --container-name ${image} --namespace ${NS} --expected-tag $tag ${TOKEN_OPTS}
  fi
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
[[ -z "$LIBERICA_DESTINATION" ]] && LIBERICA_DESTINATION="open"
if [[ $LIBERICA_DESTINATION == "private" ]] ; then
  LIBERICA_DESTINATION=""
fi

for os in ${LIBERICA_OS}; do
  for version in ${LIBERICA_VERSION}; do
    for variant in ${LIBERICA_VARIANT}; do
      DOCKER_REPOSITORY=${NS}/liberica-${LIBERICA_DESTINATION}${variant}-${os}
      DOCKER_IMAGE_NAME=liberica-${LIBERICA_DESTINATION}${variant}-${os}
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
      if [[ "$os" = "alpine-musl" ]] && [[ "$ARCH" = "armv7l" ]] ; then
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
        if [[ "x$BASE_URL" != "x" ]]; then
          EXTRA_ARGS="$EXTRA_ARGS --build-arg BASE_URL=${BASE_URL}"
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
        waitForTag ${DOCKER_IMAGE_NAME} ${TAG}-${ARCH}
        rm -rf tags.txt
        getTags ${DOCKER_IMAGE_NAME} "^$TAG-[a-zA-Z]" || die "Cannot find tag matching \"^$TAG-[a-zA-Z]\" in repo \"${DOCKER_REPOSITORY}\""
        tags=$(cat tags.txt)
        images=""
        for tag in ${tags}; do
          images="$images ${DOCKER_REPOSITORY}:$tag"
          #docker pull "${DOCKER_REPOSITORY}:$tag"
        done
        if [[ -n "$images" ]]; then
          #We do push first as it's only way to purge local manifest for now
          docker manifest push -p ${DOCKER_REPOSITORY}:${TAG} || true
          execDockerCmd manifest create ${DOCKER_REPOSITORY}:${TAG} ${images}
          execDockerCmd manifest push -p ${DOCKER_REPOSITORY}:${TAG}
        fi
      fi
    done
  done
done

