#!/bin/sh

#setup influxdb
mkdir -p ~/go/src/github.com/influxdata
cd ~/go/src/github.com/influxdata
git clone https://github.com/influxdata/influxdb.git
cd ~/go/src/github.com/influxdata/influxdb
git checkout 1.5

# environment variables
export ETHER_IP=http://142.93.0.84:8545
export ETHER_KEY=pwdnode
export DAPP_VERSION=2.0
export RETHINKDB_HOST=localhost

#dappbox service dir
cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/cmd/dappboxservice/
#get packages
go get -v ./...

#dappbox service dir
cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/cmd/dappboxservice/

#build the dappbox
go run build_dappboxservice.go

#dappbox binary directory
cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/cmd/dappboxservice/bin/

#start dappbox with specified auth type

#start with auth type username/password
./dappbox --gui-address=0.0.0.0:8384 --auth-type=username

#start with auth type metamask
#./dappbox --gui-address=0.0.0.0:8384 --auth-type=metamask

#no auth type
#./dappbox --gui-address=0.0.0.0:8384

#move meta.json file inside dappbox front end
#get path using dappbox.exe --paths command
cp ~/AppData/Local/DappBox/shared/meta.json ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/dappbox_default_front/

#dappbox frontend directory
cd ~/go/src/github.com/AlphaDinoRC/ixxo_dappbox/dappbox_default_front/

#get go dependency for front end
go get ./...

#run dappbox front end
go run main.go
