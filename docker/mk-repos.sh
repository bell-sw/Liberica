#!/bin/sh
set -x

[ -z $LIBERICA_VERSION ] && LIBERICA_VERSION="10.0.2"
[ -z $LIBERICA_VARIANT ] && LIBERICA_VARIANT="jdk jre"
[ -z $LIBERICA_OS ] && LIBERICA_OS="debian centos alpine"

REPROOT="./repos"
for os in $LIBERICA_OS; do
	for variant in $LIBERICA_VARIANT; do
		BASEDIR="${REPROOT}/liberica-open${variant}-$os"
		variantUpper=`echo "$variant" | tr '[:lower:]' '[:upper:]'`
		osCapital=`echo "$os" | sed 's/.*/\u&/'`
		
		mkdir -p "${BASEDIR}"
		cat "README.md.tpl" | OS_LOW="$os" OS_CAPITALIZED="$osCapital" JDKJRE_LOW="$variant" JDKJRE_HIGH="$variantUpper" envsubst > "${BASEDIR}/README.md"
		for version in $LIBERICA_VERSION; do
			mkdir -p "${BASEDIR}/$version"
			cat "$os/Dockerfile" | sed \
				-e "s,^\(ARG LIBERICA_ROOT\)=.*$,\1=/usr/lib/jvm/$variant-$version-bellsoft," \
				-e "s,^\(ARG LIBERICA_VERSION\)=.*$,\1=$version," \
				-e "s,^\(ARG LIBERICA_VARIANT\)=.*$,\1=$variant," \
				> "${BASEDIR}/$version/Dockerfile"
		done
	done
done

