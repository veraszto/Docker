

ARG jdk_version=11
ARG gradle_version=6.0.1

FROM adoptopenjdk:${jdk_version}-jdk-hotspot


ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION $gradle_version

#To use with SpringBoot
EXPOSE 8080

##############################################################Downloads

RUN apt update &&\
   	apt install --assume-yes\
	unzip\
	wget &&\
	wget --verbose --output-document=gradle.zip "https://downloads.gradle-dn.com/distributions/gradle-${GRADLE_VERSION}-bin.zip"

####################################################################

VOLUME /root
WORKDIR /root

RUN	echo "Installing Gradle and configuring container" \
    && unzip /gradle.zip \
    && rm /gradle.zip \
	&& locale-gen pt_BR.UTF-8 \
	&& mv "gradle-${GRADLE_VERSION}/" "${GRADLE_HOME}/" \
	&& echo "alias gradle=\"gradle --console rich\"" >> /root/.bashrc \
    && ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle \
	&& gradle --version

ENTRYPOINT apt install tzdata ; /bin/bash

