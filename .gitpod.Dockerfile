FROM gitpod/workspace-full
RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y wget
RUN sudo apt-get install -y build-essential protobuf-compiler python \
                     libprotobuf-dev libcurl4-openssl-dev \
                     libboost-all-dev libncurses5-dev \
                     libjemalloc-dev wget m4


RUN . /etc/lsb-release && echo "deb https://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
RUN wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get install rethinkdb



