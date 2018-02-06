#!/bin/bash

echo -e "Creating `software` directory...\n"

su nils
cd ~
mkdir software
cd software

echo -e "...Done\n"
echo -e "Installing `ncurses-dev` and `python3-pip`...\n"

sudo su
apt install -y ncurses-dev python3-pip

echo -e "...Done\n"
echo -e "Installing `neovim`...\n"

su nils
pip3 install --upgrade pip
pip3 install neovim

echo -e "...Done\n"
echo -e "Installing `Vim`...\n"

# Install Vim from source
git clone https://github.com/vim/vim.git
cd vim
# Checking out specific release version
git checkout tags/v8.0.1473 -b install
# Computing checksum for release version
git archive --format=tar -o ../check.tar.gz install
sha=$(git archive --format=tar install | sha256sum)
found=$(grep -q 126cdf283ef7ebd8dc9aa13dd68fbd2aad4bfab75deb443eeba5606edf23ac14 <<< "$sha")

if !found; then
  echo "Vim source couldn't be verified"
  exit 1
fi

sudo su
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

su nils
cd ~
# Downloading vim-plug
# See: https://github.com/junegunn/vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run GoInstallBinaries within Vim
# Have to run `pip install neovim` for the appropriate version of Python

echo -e "...Done\n"
echo -e "Configuring `Vim`...\n"

if [! -f ~/config/configs/vim/.vimrc] ; then
  echo "No configuration found"
  exit 1
fi

cp ~/config/configs/vim/.vimrc ~/.vimrc
cp -r ~/config/configs/vim/.vim ~/

echo -e "...Done\n"
