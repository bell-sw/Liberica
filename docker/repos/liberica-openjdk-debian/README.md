# bellsoft/liberica-openjdk-debian

## What is Liberica JDK?
Liberica JDK is free and 100% open-source Progressive Java Runtime for modern Java deployments. It is developed and supported by BellSoft, a major OpenJDK contributor. Application development with Liberica JDK is

*  Flexible. Liberica JDK supports the widest range of present-day architectures and operating systems, which makes it a unified Java runtime for desktop, server, cloud, and embedded use cases.
* Cost- and time-efficient. BellSoft produces the smallest containers in the world based on Liberica Lite and Alpine Linux, which enable companies to minimize deployment time and reduce cloud expenses.
* Secure. Liberica JDK is TCK-verified for Java SE specifications and thoroughly tested for exposures before every release. The CPU release cycle helps to deliver timely security patches and bug fixes to keep the runtime secure and performant at all times.

[Liberica JDK is recommended and used by Spring](https://spring.io/quickstart) as the end-to-end solution for Spring Native applications.
BellSoft serves millions of developers and companies from various industries across the globe. For more information, visit [www.bell-sw.com](https://www.bell-sw.com).

## How to choose an optimal Java image?

We compiled an interactive scheme that will help you decide which BellSoft’s image is perfect for your project.
![How to choose an optimal java image](https://download.bell-sw.com/static/images/how-to-choose-optimal-java-image.jpg)


## What’s in this image?

This repository contains the Liberica JDK images for Debian available for following architectures:

* x86_64 (aka amd64)
* aarch64 (aka ARM64)
* armhf (for devices like Raspberry Pi 2/3)

The tags point at the Java version (right after the OS name) and supported architecture.
Image name structure:
X-Y,
where X is the Java version and Y is the architecture type. If the architecture type is not included into the name, then the build supports AMD64 and ARM64 by default.
The ‘latest’ tag points to the latest version of an image.
For instance, [bellsoft/liberica-openjdk-debian:17](https://hub.docker.com/layers/bellsoft/liberica-openjdk-debian/17/images/sha256-305f23015e1a40436624b5ea1928051a39cd1484a6ee68553006cc1a38eb1b76?context=explore) is an image with Liberica JDK version 17 (the latest release) for Debian running on AMD64 or ARM64

## Tags

* [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/21/Dockerfile),
[`21-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/21/Dockerfile),
[`21`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/21/Dockerfile),
* [`20.0.1-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/20/Dockerfile),
[`20.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/20/Dockerfile),
[`20-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/20/Dockerfile),
[`20`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/20/Dockerfile)
* [`19.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/19/Dockerfile),
[`19.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/19/Dockerfile),
[`19.0.1-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/19/Dockerfile),
[`19.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/19/Dockerfile),
[`19-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/19/Dockerfile),
[`19`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/19/Dockerfile)
* [`18.0.2.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.2.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.2-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.1.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.1.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.1-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile),
[`18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/18/Dockerfile)
* [`17.0.7-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.6-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.4.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.4.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.4-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.3.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.3.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.3-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.1-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17-35`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile),
[`17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/17/Dockerfile)
* [`16.0.2-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/16/Dockerfile),
[`16.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/16/Dockerfile),
[`16.0.1-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/16/Dockerfile),
[`16.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/16/Dockerfile),
[`16-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/16/Dockerfile),
[`16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/16/Dockerfile)
* [`15.0.2-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/15/Dockerfile),
[`15.0.2-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/15/Dockerfile),
[`15.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/15/Dockerfile),
[`15.0.1-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/15/Dockerfile),
[`15-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/15/Dockerfile),
[`15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/15/Dockerfile)
* [`14.0.2-13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/14/Dockerfile),
[`14.0.1-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/14/Dockerfile),
[`14-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/14.0.0/Dockerfile)
[`14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/14/Dockerfile)
* [`13.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/13/Dockerfile),
[`13.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/13.0.1/Dockerfile),
[`13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/13.0.0/Dockerfile)
* [`12.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/12.0.2/Dockerfile),
[`12.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/12.0.1/Dockerfile),
[`12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/12.0.0/Dockerfile)
* [`11.0.19-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.19`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.18-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.17-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.16.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.16.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.16-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.15.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.15.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.15-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.14.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.14-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.13-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.12-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.11-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.10-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.9.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.9-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.9-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.8-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.7-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.6-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile),
[`11.0.5-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/11.0.5/Dockerfile),
[`11.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/11.0.5/Dockerfile),
[`11.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/11.0.4/Dockerfile),
[`11.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/11.0.3/Dockerfile),
[`11.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/11.0.2/Dockerfile),
[`11.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/11.0.1/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/11/Dockerfile)
* [`10.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/10.0.2/Dockerfile),
[`10.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/10.0.1/Dockerfile),
[`10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/10.0.0/Dockerfile) - armhf only (Raspberry Pi 2/3)
* [`9.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/9.0.4/Dockerfile),
[`9.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/9.0.1/Dockerfile) - armhf only (Raspberry Pi 2/3)
* [`8u392-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u392`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u382-6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u382`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u372-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u372`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u362-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u362`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u352-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u352`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u345-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u345`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u342-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u342`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u333-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u333`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u332-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u332`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u322-6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u322`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u312-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u312`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u302-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u302`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u292-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u292`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u282-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u282`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u275-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u275-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u272-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u272`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u265-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u262-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u252-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8u242-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u242/Dockerfile),
[`8u232-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u232/Dockerfile),
[`8u232`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u232/Dockerfile),
[`8u222`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u222/Dockerfile),
[`8u212`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u212/Dockerfile),
[`8u202`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u202/Dockerfile),
[`8u192`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/old/8u192/Dockerfile),
[`8u`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile),
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-debian/8/Dockerfile)   - amd64 and aarch64 only

## Usage

For example, you can run a Liberica OpenJDK 17 container with the following command:

 `docker run -it --rm bellsoft/liberica-openjdk-debian:latest java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjdk-debian image or mount volume with your code/applicaiton, for example:

 `docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjdk-debian:latest java -jar /data/MyApp.jar`

### Version specific options

* JDK 8u* version
  * `LIBERICA_USE_LITE` – defines content of JDK for this image. `0` means keep jdk unchanged, `1` (default) creates lite image, where demos, samples and sources are removed from image.
* JDK 11* and JDK 17* versions
  * `LIBERICA_IMAGE_VARIANT` – possible image variants are:
    * `base` – server VM with `java.base` module.
	* `base-minimal` – minimal VM with `java.base` module.
	* `lite` (default) – lite JDK with minimal footprint.
	* `standard` – standard JDK.
  * `LIBERICA_VM` – this option defines included VM for lite and standard image variant. Possible values are:
    * `server` (default) – add `server` VM to image.
	* `client` – add `client` VM to image.
	* `minimal` – add `minimal` VM to image.
	* `all` – add all VMs from original bundle to image.