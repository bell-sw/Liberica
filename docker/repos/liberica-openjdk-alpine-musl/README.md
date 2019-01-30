# What is Liberica?

Liberica is a 100% open-source Java implementation.
It is built from OpenJDK which BellSoft contributes to, is thoroughly
tested and passed the JCK provided under the license from OpenJDK.
Liberica supports the following architectures: x86_64, ARMv8, ARMv7
Liberica binaries for the Raspberry Pi also contain JavaFX with hardware-accelerated EGL support and Device IO API as additional modules.

Liberica is built, tested, supported and made available by BellSoft.

https://bell-sw.com/java.html

This repository contain Alpine Musl Docker images of Liberica OpenJDK and available for following architectures:
* x86_64 (aka amd64)

# Tags

The Liberica repository bellsoft/liberica-openjdk-alpine-musl provides multiple tagged images. The latest Liberica versions are:

* [`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile), [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile)

# Usage

For example, you can run a Liberica OpenJDK 11 container with the following command:

 `docker run -it --rm bellsoft/liberica-openjdk-alpine-musl:11 java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjdk-alpine-musl image or mount volume with your code/applicaiton, for example:

 `docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjdk-alpine-musl:11 java -jar /data/MyApp.jar`
