FROM gradle

SHELL ["bash", "-c"]

RUN apt update &&\
	apt --assume-yes\
	install screen

ENV SHELL /bin/bash
ENV TERM xterm-256color

ENV ANDROID_SDK_ROOT=/home/gradle/sdk/sdkmanager
ENV MY_PROJECT /home/gradle/project

#RUN apt update && apt install -y tree

WORKDIR /home/gradle

COPY screen screen

RUN usermod -aG plugdev gradle 


RUN echo -en "hellohi\nhellohi" | passwd

RUN chown -R gradle:gradle screen

USER gradle

ENV PATH ${PATH}:/home/gradle/sdk/sdkmanager/tools:/home/gradle/sdk/sdkmanager/tools/bin:/home/gradle/sdk/sdkmanager/platform-tools

RUN mkdir ~/.android && touch ~/.android/repositories.cfg

CMD ["bash"]

###########################################################################



