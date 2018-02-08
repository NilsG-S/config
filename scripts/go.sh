#!/bin/bash

go_file=https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
go_sha=a4da5f4c07dfda8194c4621611aeb7ceaab98af0b38bfb29e1be2ebb04c3556c
dep_file=https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64
dep_sha=31144e465e52ffbc0035248a10ddea61a09bf28b00784fd3fdd9882c8cbb2315

echo -e "Setting up \`downloads\`..."

cd ~
sudo -u nils mkdir -p downloads
cd downloads

echo -e "...Done"
echo -e "Installing \`Go\`...\n"

sudo -u nils curl -o go.tar.gz $go_file

if [ 0 -ne $? ] ; then
  echo -e "\`curl\` failed to retrieve \`Go\` download"
  exit 1
fi

sha256sum go.tar.gz | grep -q $go_sha

if [ 0 -ne $? ] ; then
  echo "Go download couldn't be verified"
  exit 1
fi

tar -C /usr/local/ -xzf go.tar.gz 

echo 'export PATH=$PATH:/usr/local/go/bin' | sudo -u nils tee --append ~/.profile
echo 'export GOPATH=$HOME/go' | sudo -u nils tee --append ~/.profile
echo 'export GOBIN=$HOME/go/bin' | sudo -u nils tee --append ~/.profile

echo -e "\n...Done"
echo -e "Installing \`Dep\`...\n"

sudo -u nils curl -L -o dep $dep_file 

if [ 0 -ne $? ] ; then
  echo -e "\`curl\` failed to retrieve \`Dep\` binary"
  exit 1
fi

sha256sum dep | grep -q $dep_sha

if [ 0 -ne $? ] ; then
  echo "Dep binary couldn't be verified"
  exit 1
fi

sudo -u nils chmod +x dep
mv dep /usr/local/go/bin/dep

echo -e "\n...Done"

echo "Start a new shell to get the updated paths"
