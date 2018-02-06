#!/bin/bash

# Install Vim from source
cd ~
mkdir software
cd software

apt install -y ncurses-dev python3-pip
pip3 install --upgrade pip
pip3 install neovim

git clone https://github.com/vim/vim.git
cd vim
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
  --enable-gui=gtk2 \
  --enable-cscope \
  --prefix=/usr/local
make
make install
# sudo make uninstall to remove

cd ~
# Downloading vim-plug
# See: https://github.com/junegunn/vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run GoInstallBinaries within Vim
# Have to run `pip install neovim` for the appropriate version of Python
