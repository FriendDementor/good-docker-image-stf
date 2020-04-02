FROM ubuntu:19.10

RUN apt update --assume-yes

RUN apt install adb --assume-yes

RUN export DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/America/Argentina/Cordoba /etc/localtime

RUN apt-get install -y tzdata

RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt install wget --assume-yes

RUN apt install graphicsmagick yasm pkg-config --assume-yes

RUN apt install libzmq3-dev --assume-yes

RUN apt install libprotoc17 --assume-yes




######################## rethinkdb

RUN apt install lsb-core --assume-yes

COPY ./rethinkdb.bash /root/rethinkdb.bash

RUN bash /root/rethinkdb.bash



######################### protobuf

#RUN apt install snapd --assume-yes
#RUN snap install protobuf --classic
#RUN apt install autoconf automake libtool curl make g++ unzip -y
#RUN apt install git -y

RUN apt install git --assume-yes

COPY ./protobuf.bash /protobuf.bash

RUN bash protobuf.bash



######################### node

RUN wget https://nodejs.org/download/release/v8.17.0/node-v8.17.0-linux-x64.tar.gz

RUN mkdir -p /opt/nodejs

RUN tar -xvzf node-v8.17.0-linux-x64.tar.gz -C /opt/nodejs/

COPY nodejs.bash /root/nodejs.bash

RUN /root/nodejs.bash

RUN apt-get -y install python-dev

RUN npm install node-gyp rebuild

RUN npm fund

RUN npm install -g --unsafe-perm stf

RUN ln -s /opt/nodejs/current/bin/stf /bin/stf

COPY entrypoint.bash /root/entrypoint.bash

EXPOSE 7000-8000

RUN apt install htop tmux --assume-yes

#ENTRYPOINT bash /root/entrypoint.bash

ENTRYPOINT bash

