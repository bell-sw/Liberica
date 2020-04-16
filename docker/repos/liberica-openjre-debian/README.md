# What is Liberica?

Liberica is a 100% open-source Java implementation.
It is built from OpenJDK which BellSoft contributes to, is thoroughly
tested and passed the JCK provided under the license from OpenJDK.
Liberica supports the following architectures: x86_64, ARMv8, ARMv7
Liberica binaries for the Raspberry Pi also contain JavaFX with hardware-accelerated EGL support and Device IO API as additional modules.

Liberica is built, tested, supported and made available by BellSoft.

https://bell-sw.com/java.html

This repository contains Debian Docker images of Liberica OpenJRE and available for following architectures:
* x86_64 (aka amd64)
* aarch64 (i.e. ARM64)
* armhf (for devices like Raspberry Pi 2/3)

# Tags

The Liberica repository bellsoft/liberica-openjre-debian provides multiple tagged images. The latest Liberica versions are:

* [`10.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/10.0.2/Dockerfile), 
[`10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/10.0.2/Dockerfile), 
[`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/10.0.2/Dockerfile)
* [`9.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/9.0.4/Dockerfile),
[`9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/9.0.4/Dockerfile) - armhf only (Raspberry Pi 2/3)
* [`8u252`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/8/Dockerfile), 
[`8u242`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/8u242/Dockerfile), 
[`8u232`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/8u232/Dockerfile), 
[`8u222`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/8u222/Dockerfile),  
[`8u212`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/8u212/Dockerfile),  
[`8u202`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/8u202/Dockerfile),  
[`8u192`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/old/8u192/Dockerfile), 
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/8/Dockerfile) - amd64 and aarch64 only

# Usage

For example, you can run a Liberica OpenJRE 8u212 container with the following command:

 `docker run -it --rm bellsoft/liberica-openjre-debian:8u212 java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjre-debian image or mount volume with your code/application, for example:

 `docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjre-debian:8u212 java -jar /data/MyApp.jar`
