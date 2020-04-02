#!/bin/bash
#
#apt install build-essential protobuf-compiler python \
#	    libprotobuf-dev libcurl4-openssl-dev \
#            libboost-all-dev libncurses5-dev \
#            libjemalloc-dev wget m4

#wget https://download.rethinkdb.com/dist/rethinkdb-2.4.0.tgz
#tar xf rethinkdb-2.4.0.tgz

export PYTHON=/usr/bin/python2.7

cd rethinkdb-2.4.0
./configure --allow-fetch
make
make install


