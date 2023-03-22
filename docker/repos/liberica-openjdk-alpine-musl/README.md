# bellsoft/liberica-openjdk-alpine-musl

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
This repository contains Alpine musl Docker images of Liberica JDK. Alpine Linux is a lightweight Linux distribution with the base image of ~5MB, which allows minimizing the size of a container.
We have been shipping images of Liberica JDK with Alpine musl since JDK 11. BellSoft’s engineers have upstreamed the support of this OS into JDK 16 and beyond as part of the Portola Project, and now we produce the smallest containers on the market that are only 42.72 MB, which are compatible with all Java applications.

* They are 5—7 times smaller than traditional images (based on CentOS or Debian, for example), and thus help to reduce cloud resource consumption dramatically
* They accelerate the deployment times
* Fixes and enhancements are introduced continuously and promptly, keeping the containers secure and performant at all times

Liberica JDK images for Alpine are available for following architectures:

* x86_64 (aka amd64)
* aarch64 (aka ARM64)
* armhf (for devices like Raspberry Pi 2/3)

The tags point at the Java version (right after the OS name) and supported architecture.
Image name structure:
X-Y, where X is the Java version and Y is the architecture type. If the architecture type is not included into the name, then the build supports AMD64 and ARM64 by default.
The ‘latest’ tag points to the latest version of an image.
For instance, [bellsoft/liberica-openjdk-alpine-musl:8u352-8-x86_64](https://hub.docker.com/layers/bellsoft/liberica-openjdk-alpine-musl/8u352-x86_64/images/sha256-8558eeb7cee69402c95669cdc11c1b041f8b566e4afde2b53f3ed2a14e61f3e3?context=explore) is an image with Liberica JDK version 8u352-8 for Alpine musl running on x86_64

## Tags

* [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/20/Dockerfile),
[`20-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/20/Dockerfile),
[`20`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/20/Dockerfile)
* [`19.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/19/Dockerfile),
[`19.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/19/Dockerfile),
[`19.0.1-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/19/Dockerfile),
[`19.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/19/Dockerfile),
[`19-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/19/Dockerfile),
[`19`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/19/Dockerfile)
* [`18.0.2.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.2.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.2-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.1.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.1.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.1-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile),
[`18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/18/Dockerfile)
* [`17.0.6-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.5-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.4.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.4.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.4-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.3.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.3.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.3-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.1-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17-35`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile),
[`17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile)
* [`16.0.2-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/16/Dockerfile),
[`16.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/16/Dockerfile),
[`16.0.1-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/16/Dockerfile),
[`16.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/16/Dockerfile),
[`16-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/16/Dockerfile),
[`16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/16/Dockerfile)
* [`15.0.2-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/15/Dockerfile),
[`15.0.2-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/15/Dockerfile),
[`15.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/15/Dockerfile),
[`15.0.1-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/15/Dockerfile),
[`15-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/15/Dockerfile),
[`15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/15/Dockerfile)
* [`14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/14/Dockerfile),
[`14.0.1-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/14/Dockerfile),
[`14-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/14.0.0/Dockerfile)
* [`13.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/13/Dockerfile),
[`13.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/13.0.1/Dockerfile),
[`13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/13.0.0/Dockerfile)
* [`12.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/12.0.2/Dockerfile),
[`12.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/12.0.1/Dockerfile),
[`12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/12.0.0/Dockerfile)
* [`11.0.18-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.17-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.16.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.16.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.16-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.15.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.15.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.15-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.14.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.14-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.13-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.12-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.11-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.10-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.9.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.9-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.9-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.8-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.7-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
[`11.0.6-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.6/Dockerfile),
[`11.0.5-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.5/Dockerfile),
[`11.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.5/Dockerfile),
[`11.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.4/Dockerfile),
[`11.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.3/Dockerfile),
[`11.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/old/11.0.2/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/11/Dockerfile),
* [`8u362-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u362`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u352-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u352`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u345-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u345`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u342-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u342`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u333-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u333`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u332-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u332`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u322-6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u322`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u312-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u312`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u302-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u302`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u292-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u292`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u282-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u282`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u275`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u275-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u272-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u272`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u265-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u262-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8u`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile),
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjdk-alpine-musl/8/Dockerfile)

## How to build custom Alpine Linux musl images

1. Create an empty directory and cd into it.
2. Run `curl https://raw.githubusercontent.com/bell-sw/Liberica/master/docker/repos/liberica-openjdk-alpine-musl/17/Dockerfile --output Dockerfile`
3. Run `docker build . --build-arg LIBERICA_IMAGE_VARIANT=[standard|lite|base|base-minimal]`

Dockerfile for Alpine Linux (musl variant) supports four target images out of the box:

* base: minimal runtime image with compressed java.base module, Server VM and optional files stripped, ~37 MB with Alpine base
* base-minimal: minimal runtime image with compressed java.base module, Minimal VM and optional files stripped
* lite: Liberica JDK lite image with minimal footprint and Server VM, ~ 100 MB (default)
* standard: Liberica JDK standard image with Server VM and jmods, can be used to create arbitrary module set, ~180 MB

Target can be chosen by modifying argument LIBERICA_IMAGE_VARIANT or redefining it via --build-arg parameter to have specific Liberica image installed.

To save space, users are encouraged to create their own runtimes using jmod command sufficient to run the target application.

If you are ready to sacrifice performance for static footprint, please consider using Minimal VM instead of Server VM or Client VM. With that, it's possible to create a runtime as small as < 20 Mb.

### Version specific variables ##

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

## Usage

For example, you can run a Liberica OpenJDK 14 container with the following command:

`docker run -it --rm bellsoft/liberica-openjdk-alpine-musl:latest java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjdk-alpine-musl image or mount volume with your code/applicaiton, for example:

`docker run -it --rm -v /home/user/project/:/data bellsoft/liberica-openjdk-alpine-musl:latest java -jar /data/MyApp.jar`

## Off-screen rendering

Containerized deployments sometimes do some off-screen rendering, such as when preparing documents, forms, and images. When performing off-screen rendering, the JDK requires OS fonts and `fontconfig` libraries to be present.
In case when you don't have these libraries or fonts you will encounter the exception, similar to one below:

```shell
Exception in thread "main" java.lang.InternalError: java.lang.reflect.InvocationTargetException
	at java.desktop/sun.font.FontManagerFactory$1.run(FontManagerFactory.java:86)
	at java.base/java.security.AccessController.doPrivileged(AccessController.java:312)
	at java.desktop/sun.font.FontManagerFactory.getInstance(FontManagerFactory.java:74)
	at java.desktop/sun.font.SunFontManager.getInstance(SunFontManager.java:247)
	at java.desktop/sun.font.FontDesignMetrics.getMetrics(FontDesignMetrics.java:261)
	at java.desktop/sun.swing.SwingUtilities2.getFontMetrics(SwingUtilities2.java:1243)
...
	at jdk.compiler/com.sun.tools.javac.launcher.Main.run(Main.java:192)
	at jdk.compiler/com.sun.tools.javac.launcher.Main.main(Main.java:132)
Caused by: java.lang.NullPointerException
	at java.desktop/sun.awt.FontConfiguration.getVersion(FontConfiguration.java:1262)
	at java.desktop/sun.awt.FontConfiguration.readFontConfigFile(FontConfiguration.java:225)
	at java.desktop/sun.awt.FontConfiguration.init(FontConfiguration.java:107)
	at java.desktop/sun.awt.X11FontManager.createFontConfiguration(X11FontManager.java:719)
	at java.desktop/sun.font.SunFontManager$2.run(SunFontManager.java:362)
	at java.base/java.security.AccessController.doPrivileged(AccessController.java:312)
	at java.desktop/sun.font.SunFontManager.<init>(SunFontManager.java:307)
	at java.desktop/sun.awt.FcFontManager.<init>(FcFontManager.java:35)
	at java.desktop/sun.awt.X11FontManager.<init>(X11FontManager.java:56)
	... 28 more
```

On Alpine Linux, these libraries are provided by `fontconfig` and `ttf-dejavu` packages, and can be installed by running the following command:

```apk add fontconfig ttf-dejavu```

The Liberica JDK Dockerfile can be built with these libraries by specifying `OPT_PKGS` build argument:

```shell
docker build -t bellsoft/liberica-openjdk-alpine-musl:15 \
  --build-arg LIBERICA_VERSION=15.0.1-9 \
  --build-arg LIBERICA_BUILD=9 \
  --build-arg LIBERICA_VARIANT=jdk \
  --build-arg LIBERICA_ROOT=/usr/lib/jvm/jdk-15-bellsoft-x86_64 \
  --build-arg OPT_PKGS="fontconfig ttf-dejavu"
```
