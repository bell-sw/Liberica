# bellsoft/liberica-openjre-rocky

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

This repository contains the Liberica JRE images for Rocky Linux available for following architectures:

* x86_64 (aka amd64)
* aarch64 (aka ARM64)


The tags point at the Java version (right after the OS name) and supported architecture.
Image name structure:
X-Y,
where X is the Java version and Y is the architecture type. If the architecture type is not included into the name, then the build supports AMD64 and ARM64 by default.
The ‘latest’ tag points to the latest version of an image. Images with '-cds' in tag contain CDS (Class Data Sharing) archive.
For instance, [bellsoft/liberica-openjre-rocky:11.0.25-11-cds-x86_64](https://hub.docker.com/layers/bellsoft/liberica-openjre-rocky/11.0.25-11-cds-x86_64/images/sha256-1a19fad4c8c3c2aa933c35d6644317d87e93d4053fc48980e608688cdf32c89e?context=explore) is an image with Liberica JRE version 11.0.25-11 with CDS for Rocky running on AMD64.

## Tags

* [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`latest-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`23.0.1-13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`23.0.1-13-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`23.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`23.0.1-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`23`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
[`23-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/23/Dockerfile),
* [`21.0.5-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/21/Dockerfile),
[`21.0.5-11-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/21/Dockerfile),
[`21.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/21/Dockerfile),
[`21.0.5-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/21/Dockerfile),
[`21`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/21/Dockerfile),
[`21-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/21/Dockerfile),
* [`17.0.13-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/17/Dockerfile),
[`17.0.13-12-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/17/Dockerfile),
[`17.0.13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/17/Dockerfile),
[`17.0.13-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/17/Dockerfile),
[`17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/17/Dockerfile),
[`17-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/17/Dockerfile)
* [`11.0.25-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/11/Dockerfile),
[`11.0.25-11-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/11/Dockerfile),
[`11.0.25`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/11/Dockerfile),
[`11.0.25-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/11/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/11/Dockerfile),
[`11-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/11/Dockerfile)
* [`8u432-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile),
[`8u432-7-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile),
[`8u432`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile),
[`8u432-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile),
[`8u`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile)
[`8u-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile)
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile)
[`8-cds`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-rocky/8/Dockerfile)

## Usage

For example, you can run a Liberica OpenJRE 8u432 container with the following command:

 `docker run -it --rm bellsoft/liberica-openjre-rocky:8u432 java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjre-rocky image or mount volume with your code/applicaiton, for example:

 `docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjre-rocky:8u432 java -jar /data/MyApp.jar`
