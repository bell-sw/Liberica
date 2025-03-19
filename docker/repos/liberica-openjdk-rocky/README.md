# bellsoft/liberica-openjdk-rocky

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

This repository contains the Liberica JDK images for Rocky Linux available for following architectures:

* x86_64 (aka amd64)
* aarch64 (aka ARM64)

The tags point at the Java version (right after the OS name) and supported architecture.
Image name structure:
X-Y,
where X is the Java version and Y is the architecture type. If the architecture type is not included into the name, then the build supports AMD64 and ARM64 by default.
The ‘latest’ tag points to the latest version of an image. Images with '-cds' in tag contain CDS (Class Data Sharing) archive.

For instance, [bellsoft/liberica-openjdk-rocky:8u432-7-x86_64](https://hub.docker.com/layers/bellsoft/liberica-openjdk-rocky/8u432-7-x86_64/images/sha256-3e36546c8525d36a26bd6005eecb6c403db9a54b4d3ce9ca901c65609eb70544?context=explore) is an image with Liberica JDK version 8u432 for Rocky  running on AMD64.

## Tags

* [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/24/Dockerfile),
[`latest-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/24/Dockerfile),
[`24-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/24/Dockerfile),
[`24-37-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/24/Dockerfile)
[`24`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/24/Dockerfile),
[`24-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/24/Dockerfile),
* [`23`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/23/Dockerfile),
[`23-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/23/Dockerfile),
* [`21.0.6-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/21/Dockerfile),
[`21.0.6-10-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/21/Dockerfile),
[`21.0.6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/21/Dockerfile),
[`21.0.6-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/21/Dockerfile),
[`21`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/21/Dockerfile),
[`21-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/21/Dockerfile)
* [`17.0.14-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/17/Dockerfile),
[`17.0.14-10-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/17/Dockerfile),
[`17.0.14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/17/Dockerfile),
[`17.0.14-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/17/Dockerfile),
[`17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/17/Dockerfile),
[`17-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/17/Dockerfile)
* [`11.0.26-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/11/Dockerfile),
[`11.0.26-9-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/11/Dockerfile),
[`11.0.26`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/11/Dockerfile),
[`11.0.26-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/11/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/11/Dockerfile),
[`11-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/11/Dockerfile)
* [`8u442-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8u442-7-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8u442`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8u442-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8u`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8u-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile),
[`8-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-rocky/8/Dockerfile)

## Usage

For example, you can run a Liberica OpenJDK 17 container with the following command:

 `docker run -it --rm bellsoft/liberica-openjdk-rocky:17 java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjdk-rocky image or mount volume with your code/applicaiton, for example:

 `docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjdk-rocky:latest java -jar /data/MyApp.jar`

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
