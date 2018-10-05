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
if [ -z $LIBERICA_ARCH ]; then
	#LIBERICA_ARCH="amd64"

	LOCAL_ARCH=`uname -m`
	case $LOCAL_ARCH in
		x86_64)
			LIBERICA_ARCH="amd64"
			LIBERICA_ARCH_TAG="amd64"
			;;
		aarch64)
			LIBERICA_ARCH=$LOCAL_ARCH
			LIBERICA_ARCH_TAG="ARMv8"
			;;
		armv[67]l)	
			LIBERICA_ARCH="arm32-vfp-hflt"
			LIBERICA_ARCH_TAG=""
			;;
		*)
			LIBERICA_ARCH=$LOCAL_ARCH
			[ -z $LIBERICA_ARCH_TAG ] && LIBERICA_ARCH_TAG="$LIBERICA_ARCH"
			;;
	esac
else
	[ -z $LIBERICA_ARCH_TAG ] && LIBERICA_ARCH_TAG="$LIBERICA_ARCH"
fi

[ -z $LIBERICA_VERSION ] && LIBERICA_VERSION="10.0.2 10.0.2:10 10.0.2:latest"
[ -z $LIBERICA_VARIANT ] && LIBERICA_VARIANT="jdk jre"
[ -z $LIBERICA_OS ] && LIBERICA_OS="debian centos alpine"

for os in $LIBERICA_OS; do
	for version in $LIBERICA_VERSION; do
		for variant in $LIBERICA_VARIANT; do
			TAG=$version
			V=$version
			`echo "$version" | grep -q -- ':'` && TAG=`echo "$version" | cut -d: -f2` && V=`echo "$version" | cut -d: -f1`
			BUILD_PATH="./$os"
			[ -f ./$LIBERICA_ARCH/$os/Dockerfile ] && BUILD_PATH="./$LIBERICA_ARCH/$os"

			EXTRA_ARGS=
			if [ "$os" = "alpine" ]; then
				#Add some caching
				docker build -t ${NS}/glibc-cache --target glibc-base --cache-from ${NS}/glibc-cache $BUILD_PATH
				EXTRA_ARGS="--cache-from ${NS}/glibc-cache --cache-from ${NS}/liberica-open${variant}-$os:$TAG --cache-from ${NS}/liberica-open${variant}-$os"
				[ "$TAG" = "V" ] || EXTRA_ARGS="$EXTRA_ARGS --cache-from ${NS}/liberica-open${variant}-$os:$V"
			fi
			echo "Building Liberica $variant v $version..."
			docker build -t ${NS}/liberica-open${variant}-$os:$TAG \
				--build-arg LIBERICA_ARCH=$LIBERICA_ARCH \
				--build-arg LIBERICA_ARCH_TAG=$LIBERICA_ARCH_TAG \
				--build-arg LIBERICA_VERSION=$V \
				--build-arg LIBERICA_VARIANT=$variant \
				$EXTRA_ARGS \
				$BUILD_PATH
			if [ "$PUSH" = "1" ]; then
				docker tag  ${NS}/liberica-open${variant}-$os:$TAG  ${NS}/liberica-open${variant}-$os:$TAG-$LIBERICA_ARCH
				docker push ${NS}/liberica-open${variant}-$os:$TAG-$LIBERICA_ARCH

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
			fi
		done
	done
done

