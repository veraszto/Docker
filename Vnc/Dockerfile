# Please provide a password on at build time, --build-args PASSWORD=hellohi
# to set both vnc and root password

FROM ubuntu

ARG PASSWORD

RUN apt update &&\
	apt --assume-yes\
	install vnc4server\
#	libcurl4\
	fluxbox\
	xterm\
	gconf-service\
	libasound2\
	libatk1.0-0\
	libcairo2\
	libcups2\
	libdbus-1-3\
	libgconf-2-4\
	libgdk-pixbuf2.0-0\
	libglib2.0-0\
	libgtk2.0-0\
	libnspr4\
	libnss3\
	libpango1.0-0\
	libxss1\
	fonts-liberation\
	libappindicator1\
	libcurl3\
	xdg-utils\
	fonts-ubuntu\
	hsetroot\
	wget

RUN useradd --create-home --shell /bin/bash hello

SHELL ["/bin/bash", "-c"]

WORKDIR /home/hello

VOLUME ["/home/hello/volume"]

#This Chrome should be taken from somewhere and put herein this folder
COPY chrome64_49.0.2623.75.deb .

RUN dpkg -i /home/hello/chrome64_49.0.2623.75.deb

RUN	mkdir /home/hello/httpd &&\
	echo Hello > /home/hello/httpd/hello &&\
	chown -R hello:hello /home/hello/httpd

EXPOSE 47892/tcp 47000/tcp

COPY xstartup .vnc/xstartup  

COPY my-theme /usr/share/fluxbox/styles/custom-ubuntu

COPY stranger_things.jpg /usr/share/images/fluxbox

RUN sed -i -e \
	"s/\(session\.styleFile:\).*/\1 \/usr\/share\/fluxbox\/styles\/custom-ubuntu/"\
	 /etc/X11/fluxbox/init

RUN chown -R hello:hello /home/hello/.vnc

RUN ["/bin/bash", "-c", "echo -en \"$PASSWORD\n$PASSWORD\" | passwd root"]

USER hello

ENV USER=hello DISPLAY=:1 wpsetters=hsetroot 

RUN touch $HOME/.Xauthority && touch $HOME/.Xsession

RUN ["/bin/bash", "-c", "echo -en \"$PASSWORD\n$PASSWORD\n\n\" | vncpasswd"]

ENTRYPOINT 	vnc4server -httpd /home/hello/httpd -httpPort 47000 -rfbport 47892 :1 &&\
			/bin/bash && cd


