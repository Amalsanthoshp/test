FROM gitpod/workspace-full
RUN sudo apt-get update && sudo apt-get -y upgrade
RUN sudo apt-get install -y wget
RUN wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
RUN sudo tar -xvf go1.13.3.linux-amd64.tar.gz
RUN sudo mv go /usr/local
RUN export GOROOT=/usr/local/go
RUN export GOPATH=$HOME/go/src
RUN export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
