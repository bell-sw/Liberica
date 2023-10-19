# bellsoft/liberica-openjre-alpine-musl

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
This repository contains Alpine musl Docker images of Liberica JRE. Alpine Linux is a lightweight Linux distribution with the base image of ~5MB, which allows minimizing the size of a container.
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
For instance, [bellsoft/liberica-openjre-alpine-musl:17.0.5-aarch64](https://hub.docker.com/layers/bellsoft/liberica-openjre-alpine-musl/17.0.5-aarch64/images/sha256-ed4df8d9426c38a2fae566623663ec5fe7b182a52e538954e062ed64f49c8725?context=explore) is an image with Liberica JRE version 17.0.5 for Alpine musl running on AArch64

## Tags

* [`latest`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/21/Dockerfile),
[`21-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/21/Dockerfile),
[`21`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-debian/21/Dockerfile),
* [`20.0.1-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/20/Dockerfile),
[`20.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/20/Dockerfile),
[`20-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/20/Dockerfile),
[`20`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/20/Dockerfile)
* [`19.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/19/Dockerfile),
[`19.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/19/Dockerfile),
[`19.0.1-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/19/Dockerfile),
[`19.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/19/Dockerfile),
[`19-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/19/Dockerfile),
[`19`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/19/Dockerfile)
* [`18.0.2.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.2.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.2-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.1.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.1.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.1-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18-37`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile),
[`18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/18/Dockerfile)
* [`17.0.7-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.6-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.5-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.5`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.4.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.4.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.4-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.3.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.3.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.3-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.3`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.2-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.1-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17-35`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile),
[`17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/17/Dockerfile)
* [`16.0.2-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/16/Dockerfile),
[`16.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/16/Dockerfile),
[`16.0.1-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/16/Dockerfile),
[`16.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/16/Dockerfile),
[`16-36`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/16/Dockerfile),
[`16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/16/Dockerfile)
* [`15.0.2-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/15/Dockerfile),
[`15.0.2-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/15/Dockerfile),
[`15.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/15/Dockerfile),
[`15.0.1-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/15/Dockerfile),
[`15.0.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/15/Dockerfile),
[`15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/15/Dockerfile)
* [`11.0.19-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.19`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.18-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.18`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.17-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.17`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.16.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.16.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.16-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.16`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.15.1-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.15.1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.15-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.15`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.14.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.14-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.14`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.13-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.13`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.12-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.11-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.10-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.9.1-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.9-12`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.9-11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11.0.9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
[`11`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/11/Dockerfile),
* [`10.0.2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/10.0.2/Dockerfile),
[`10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/10.0.2/Dockerfile)
* [`9.0.4`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/9.0.4/Dockerfile),
[`9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/9.0.4/Dockerfile) - armhf only (Raspberry Pi 2/3)
* [`8u392-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u392`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u382-6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u382`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u372-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u372`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u362-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u362`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u352-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u352`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u345-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u345`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u342-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u342`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u333-2`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u333`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u332-9`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u332`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u322-6`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u322`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u312-7`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u312`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u302-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u302`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u292-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u292`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u282-8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u282`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u275-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u275`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u272-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u272`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u265-1`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u265`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u262-10`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u262`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u252`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile),
[`8u242`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/8u242/Dockerfile),
[`8u232`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/8u232/Dockerfile),
[`8u222`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/8u222/Dockerfile),
[`8u212`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/8u212/Dockerfile),
[`8u202`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/8u202/Dockerfile),
[`8u192`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/old/8u192/Dockerfile),
[`8`](https://github.com/bell-sw/Liberica/blob/master/docker/repos/liberica-openjre-alpine-musl/8/Dockerfile) - amd64 and aarch64 only

## Usage

For example, you can run a Liberica OpenJRE 8u272 container with the following command:

 `docker run -it --rm bellsoft/liberica-openjre-alpine-musl:8u272 java -version`

To run some application you can create Dockerfile, based on bellsoft/liberica-openjre-alpine-musl-musl image or mount volume with your code/applicaiton, for example:

 `docker run -it --rm  -v /home/user/project/:/data bellsoft/liberica-openjre-alpine-musl-musl:8u272 java -jar /data/MyApp.jar`

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
docker build -t bellsoft/liberica-openjre-alpine-musl:8u272 \
  --build-arg LIBERICA_RELEASE_TAG=8u272+10 \
  --build-arg LIBERICA_VERSION=8u272 \
  --build-arg LIBERICA_BUILD=10 \
  --build-arg LIBERICA_VARIANT=jre \
  --build-arg LIBERICA_ROOT=/usr/lib/jvm/jre-8u272-bellsoft-x86_64 \
  --build-arg OPT_PKGS="fontconfig ttf-dejavu"
```
