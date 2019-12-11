FROM gitpod/workspace-full
RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y wget

# RUN sudo apt-get update \
# && sudo apt-get install -y \
# protobuf-compiler \
# libprotobuf-dev \
# libboost-all-dev \
# libncurses5-dev \
# libjemalloc-dev \
# && sudo rm -rf /var/lib/apt/lists/*

# # Build and install RethinkDB from source.
# RUN mkdir -p /tmp/rethinkdb \
# && cd /tmp/rethinkdb \
# && wget -qOrethinkdb.tgz https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz \
# && tar xf rethinkdb.tgz \
# && cd rethinkdb-* \
# && ./configure --allow-fetch CXX=clang++-10 \
# && make -jnproc \
# && sudo make install \
# && sudo rm -rf /tmp/rethinkdb

# RUN mkdir -p /tmp/go    \
# && cd /tmp/go  \
# && wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz \
# && tar -xvf go1.13.3.linux-amd64.tar.gz
# RUN mv go /usr/local
# RUN sudo rm -rf /tmp/go

RUN sudo apt-get install -y build-essential protobuf-compiler python \
                     libprotobuf-dev libcurl4-openssl-dev \
                     libboost-all-dev libncurses5-dev \
                     libjemalloc-dev wget m4

RUN mkdir -p /tmp/rethink   \
&& cd /tmp/rethink \
&& wget https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz \
&& tar xf rethinkdb-2.3.6.tgz
RUN cd /tmp/rethink/rethinkdb-2.3.6 \
&& ./configure --allow-fetch \
&& make \
&& sudo make install 


