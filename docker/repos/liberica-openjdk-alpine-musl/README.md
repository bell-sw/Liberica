# What is Liberica?

Liberica is a 100% open-source Java implementation. It is built from OpenJDK which BellSoft contributes to, is thoroughly tested and passed the JCK provided under the license from OpenJDK. Liberica supports the following architectures: x86_64, ARMv8, ARMv7 Liberica binaries for the Raspberry Pi also contain JavaFX with hardware-accelerated EGL support and Device IO API as additional modules.

Liberica is built, tested, supported and made available by BellSoft.

https://bell-sw.com/java.html

This repository contain Alpine Musl Docker images of Liberica OpenJDK and available for following architectures:

* x86_64 (aka amd64)

# Tags

The Liberica repository bellsoft/liberica-openjdk-alpine-musl provides multiple tagged images. The latest Liberica versions are:

* [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/13/Dockerfile),
[`13.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/13/Dockerfile),
[`13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/13.0.0/Dockerfile)
* [`12.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/12.0.2/Dockerfile),
[`12.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/12.0.1/Dockerfile),
[`12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/12.0.0/Dockerfile)
* [`11.0.5-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.4/Dockerfile),
[`11.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.3/Dockerfile),
[`11.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.2/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile)

# How to build custom Alpine Linux musl images

1. Create an empty directory and cd into it.
2. Run `curl https://raw.githubusercontent.com/bell-sw/Liberica/master/docker/repos/liberica-openjdk-alpine-musl/12/Dockerfile --output Dockerfile`
3. Run `docker build . --build-arg LIBERICA_IMAGE_VARIANT=[full|lite|base]`

Dockerfile for Alpine Linux (musl variant) supports three target images out of the box:

* base: minimal runtime image with compressed java.base module, Server VM and optional files stripped, ~37 MB with Alpine base
* lite: Liberica JDK lite image with minimal footprint and Server VM, ~ 100 MB (default)
* full: Liberica JDK full image with Server VM and jmods, can be used to create arbitrary module set, ~180 MB

Target can be chosen by modifying argument LIBERICA_IMAGE_VARIANT or redefining it via --build-arg parameter to have specific Liberica image installed.

To save space, users are encouraged to create their own runtimes using jmod command sufficient to run the target application. 

If you are ready to sacrifice performance for static footprint, please consider using Minimal VM instead of Server VM or Client VM. With that, it's possible to create a runtime as small as < 20 Mb.

# Usage

For example, you can run a Liberica OpenJDK 13.0.1 container with the following command:

`docker run -it --rm bellsoft/liberica-openjdk-alpine-musl:latest java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjdk-alpine-musl image or mount volume with your code/applicaiton, for example:

`docker run -it --rm -v /home/user/project/:/data bellsoft/liberica-openjdk-alpine-musl:latest java -jar /data/MyApp.jar`
