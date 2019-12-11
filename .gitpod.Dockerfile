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

# RUN mkdir -p /tmp/rethink   \
# && cd /tmp/rethink \
# && wget https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz \
# && tar xf rethinkdb-2.3.6.tgz
# RUN cd /tmp/rethink/rethinkdb-2.3.6 \
# && ./configure --allow-fetch \
# && make \
# && sudo make install 
# RUN git clone https://github.com/trufflesuite/ganache.git
# RUN sudo apt-get install -y nodejs

RUN . /etc/lsb-release && echo "deb https://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get install rethinkdb
#setup influxdb
RUN mkdir -p ~/go/src/github.com/influxdata
RUN cd ~/go/src/github.com/influxdata
RUN git clone https://github.com/influxdata/influxdb.git
RUN mv influxdb ~/go/src/github.com/influxdata/
RUN cd ~/go/src/github.com/influxdata/influxdb
RUN git checkout 1.5

# environment variables
RUN export ETHER_IP=http://142.93.0.84:8545
RUN export ETHER_KEY=pwdnode
RUN export DAPP_VERSION=2.0

RUN export RETHINKDB_HOST=localhost

#dappbox service dir

RUN cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/cmd/dappboxservice/
#get packages

RUN go get -v ./...

#dappbox service dir

RUN cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/cmd/dappboxservice/

#build the dappbox

RUN go run build_dappboxservice.go

#dappbox binary directory

RUN cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/cmd/dappboxservice/bin/

#start dappbox with specified auth type

#start with auth type username/password

RUN ./dappbox --gui-address=0.0.0.0:8384 --auth-type=username

#start with auth type metamask
#./dappbox --gui-address=0.0.0.0:8384 --auth-type=metamask

#no auth type
#./dappbox --gui-address=0.0.0.0:8384

#move meta.json file inside dappbox front end
#get path using dappbox.exe --paths command

RUN cp ~/AppData/Local/DappBox/shared/meta.json ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/dappbox_default_front/

#dappbox frontend directory

RUN cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/dappbox_default_front/

#get go dependency for front end

RUN go get ./...

#run dappbox front end

RUN go run main.go



