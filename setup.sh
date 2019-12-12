mkdir /workspace/go/src
mkdir /workspace/go/github.com/
export GOPATH=/workspace/go
cd $GOPATH/src/github.com/
mkdir -p AlphaDinoRC
cd AlphaDinoRC
git clone https://github.com/AlphaDinoRC/ixxo_dappbox.git
cd $GOPATH/src/github.com/AlphaDinoRC/ixxo_dappbox
sh dappbox_build_linux.sh 
