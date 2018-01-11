#!/bin/bash

cd ~
mkdir software
cd software

curl -O https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz

go_dl_page=$(curl -L https://golang.org/dl/)
go_dl_sha_full=$(sha256sum go1.9.2.linux-amd64.tar.gz)
go_dl_sha=$(echo $go_dl_sha_full | head -n1 | awk '{print $1}')

if grep -q $go_dl_sha <<< "$go_dl_page"; then
  echo "true"
else
  echo "false"
fi

apt-add-repository ppa:deadsnakes/ppa
apt-get update
apt-get install -y ncurses-dev python3.6
python3.6 -m pip install neovim

git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
--enable-multibyte \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-gui=gtk2 \
--enable-cscope \
--prefix=/usr/local
make
make install

cd ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd software
git clone https://github.com/NilsG-S/config.git
