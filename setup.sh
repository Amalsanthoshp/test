

# hello i made some changes!!!
# i've added some comments LOL!!
mkdir thenga

mkdir /workspace/go
mkdir /workspace/go/src
mkdir /workspace/go/src/github.com/
export GOPATH=/workspace/go
cd $GOPATH/src/github.com/
mkdir -p AlphaDinoRC
cd AlphaDinoRC
git clone https://github.com/AlphaDinoRC/ixxo_dappbox.git
cd /workspace/test/
./dappbox_build_linux.sh 
