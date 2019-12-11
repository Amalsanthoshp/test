FROM gitpod/workspace-full
RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y wget

RUN sudo apt-get update \
&& sudo apt-get install -y \
protobuf-compiler \
libprotobuf-dev \
libboost-all-dev \
libncurses5-dev \
libjemalloc-dev \
libssl1.0-dev \
&& sudo rm -rf /var/lib/apt/lists/*

# Build and install RethinkDB from source.
RUN mkdir -p /tmp/rethinkdb \
&& cd /tmp/rethinkdb \
&& wget -qOrethinkdb.tgz https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz \
&& tar xf rethinkdb.tgz \
&& cd rethinkdb-* \
&& ./configure --allow-fetch CXX=clang++-10 \
&& make -jnproc \
&& sudo make install \
&& sudo rm -rf /tmp/rethinkdb

RUN mkdir -p /tmp/go    \
&& cd /tmp/go  \
&& wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
&& tar -xvf go1.13.3.linux-amd64.tar.gz
RUN mv go /usr/local
RUN sudo rm -rf /tmp/go

