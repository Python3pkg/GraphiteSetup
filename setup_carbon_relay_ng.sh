go version

if [ $? != 0 ]
then
wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
tar xf $go_version.tar.gz

echo "GOROOT: where go is installed"
export GOROOT=$SCRIPT_PATH/go
export PATH=$PATH:$GOROOT/bin

echo $GOROOT
fi


echo "INSIDE SETUP CARBON RELAY NG SCRIPT"
SCRIPT_PATH=$(pwd)
echo $SCRIPT_PATH

echo $SCRIPT_PATH
echo "GOPATH: where go tools are there"
export GOPATH=$SCRIPT_PATH/gocode
echo $GOPATH


echo "include executables in the path"
export PATH=$PATH:$GOPATH/bin
echo $PATH


mkdir -p $GOPATH
mkdir -p /tmp/carbon-relay-ng/spool


echo "[INFO] ===== Cloning carbon-relay-ng ===== "
go get -d github.com/graphite-ng/carbon-relay-ng
echo "[INFO] ===== Cloning go-bindata ===== "
go get github.com/jteeuwen/go-bindata/...

echo "[INFO] ===== Compiling carbon-relay-ng ===== "
cd $GOPATH/src/github.com/graphite-ng/carbon-relay-ng
make

echo "[INFO] ===== Moving compiled carbon-relay-ng binary to bin folder ===== "
mv $GOPATH/src/github.com/graphite-ng/carbon-relay-ng/carbon-relay-ng $SCRIPT_PATH/bin/