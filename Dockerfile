FROM ubuntu:14.04
MAINTAINER Han Sangjin "tinysun.net@gmail.com"

RUN apt-get update -y

# for X11
RUN apt-get install -y xpra
RUN apt-get install -y xvfb
RUN apt-get install -y xserver-xephyr
RUN apt-get install -y xterm

# for SSH daemon
RUN apt-get -y install ssh

# for Wine
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntu-wine/ppa
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install -y wine


COPY  startup.sh  /usr/local/bin/
EXPOSE 22

CMD ["/usr/local/bin/startup.sh"]
