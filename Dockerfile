FROM ubuntu:20.04

RUN apt update --assume-yes

RUN apt install adb --assume-yes

RUN export DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/America/Argentina/Cordoba /etc/localtime

RUN apt-get install -y tzdata

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt install npm --assume-yes

RUN apt install wget --assume-yes

RUN apt install graphicsmagick yasm pkg-config --assume-yes

#RUN apt install snapd --assume-yes

RUN apt install libzmq3-dev --assume-yes

#RUN snap install protobuf --classic

RUN apt install autoconf automake libtool curl make g++ unzip -y

RUN apt install git -y

COPY ./protobuf.bash /protobuf.bash

RUN bash protobuf.bash

RUN source /etc/lsb-release && echo "deb https://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list

RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -

RUN apt-get update --asume-yes

RUN apt-get install rethinkdb --asume-yes

COPY ./install_node8.bash /root/.installNVM

RUN echo "bash .installNVM" >> /root/.bashrc

ENTRYPOINT sh

