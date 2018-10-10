#!/bin/sh
set -x

getTags() {
	image="$1"
	_grep="$2"
	tags=`curl -sSL https://registry.hub.docker.com/v1/repositories/${image}/tags | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}' | grep -E -- "$_grep"`
	echo $tags
}

PUSH=$1
[ -z $PUSH ] && PUSH="0"

PUSH_MANIFEST=$2
[ -z $PUSH_MANIFEST ] && PUSH_MANIFEST="0"

NS=bellsoft
ARCH=`uname -m`

[ -z $LIBERICA_VERSION ] && LIBERICA_VERSION="11 11:11.0.0 11:latest"
[ -z $LIBERICA_VARIANT ] && LIBERICA_VARIANT="jdk"
[ -z $LIBERICA_OS ] && LIBERICA_OS="debian centos alpine"

for os in $LIBERICA_OS; do
	for version in $LIBERICA_VERSION; do
		for variant in $LIBERICA_VARIANT; do
			TAG=$version
			V=$version
			`echo "$version" | grep -q -- ':'` && TAG=`echo "$version" | cut -d: -f2` && V=`echo "$version" | cut -d: -f1`
			BUILD_PATH="./$os"
			#[ -f ./$ARCH/$os/Dockerfile ] && BUILD_PATH="./$ARCH/$os"

			EXTRA_ARGS=
			if [ "$os" = "alpine" ]; then
				#Add some caching
				docker build -t ${NS}/glibc-cache --target glibc-base --cache-from ${NS}/glibc-cache $BUILD_PATH
				EXTRA_ARGS="--cache-from ${NS}/glibc-cache --cache-from ${NS}/liberica-open${variant}-$os:$V --cache-from ${NS}/liberica-open${variant}-$os"
				if [ "$TAG" != "$V" ]; then
					EXTRA_ARGS="$EXTRA_ARGS --cache-from ${NS}/liberica-open${variant}-$os:$TAG"
				fi
			fi
			echo "Building Liberica $variant v $version..."
			docker build -t ${NS}/liberica-open${variant}-$os:$TAG \
				--build-arg LIBERICA_VERSION=$V \
				--build-arg LIBERICA_VARIANT=$variant \
				--build-arg LIBERICA_ROOT="/usr/lib/jvm/${variant}-${V}-bellsoft-${ARCH}" \
				$EXTRA_ARGS \
				$BUILD_PATH

			if [ "$PUSH" = "1" ]; then
				docker tag  ${NS}/liberica-open${variant}-$os:$TAG ${NS}/liberica-open${variant}-$os:$TAG-$ARCH
				docker push ${NS}/liberica-open${variant}-$os:$TAG-$ARCH
			fi

			if [ "$PUSH_MANIFEST" = "1" ]; then
				tags=`getTags ${NS}/liberica-open${variant}-$os "^$TAG-"`
				images=""
				for tag in $tags; do
					images="$images ${NS}/liberica-open${variant}-$os:$tag"
					docker pull "${NS}/liberica-open${variant}-$os:$tag"
				done
				if [ -n "$images" ]; then
					docker manifest create ${NS}/liberica-open${variant}-$os:$TAG $images
					docker manifest push ${NS}/liberica-open${variant}-$os:$TAG
				fi
			fi

		done
	done
done

