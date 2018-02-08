#!/bin/bash

echo -e "Creating \`software\` directory...\n"

cd ~
sudo -u nils mkdir software
cd software

echo -e "\n...Done"
echo -e "Installing \`ncurses-dev\` and \`python3-pip\`...\n"

apt install -y ncurses-dev python3-pip

echo -e "\n...Done"
echo -e "Upgrading \`Pip\`...\n"

pip3 install --upgrade pip

echo -e "\n...Done"
echo -e "Installing \`neovim\`...\n"

pip3 install neovim

echo -e "\n...Done"
echo -e "Installing \`Vim\`...\n"

# Install Vim from source
sudo -u nils git clone https://github.com/vim/vim.git
cd vim
# Checking out specific release version
sudo -u nils git checkout tags/v8.0.1473 -b install
# Computing checksum for release version
sha=$(git archive --format=tar install | sha256sum)
found=$(grep -q 126cdf283ef7ebd8dc9aa13dd68fbd2aad4bfab75deb443eeba5606edf23ac14 <<< "$sha")

if [ ! $found ]; then
  echo "Vim source couldn't be verified"
  exit 1
fi

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
sudo -u nils curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\n...Done"
echo -e "Configuring \`Vim\`...\n"

if [ ! -f ~/config/configs/vim/.vimrc ] ; then
  echo "No configuration found"
  exit 1
fi

sudo -u nils cp ~/config/configs/vim/.vimrc ~/.vimrc
sudo -u nils cp -r ~/config/configs/vim/.vim ~/

echo -e "\n...Done\n"

echo "Don't forget to run the following commands within Vim:" 
echo "- PlugInstall"
echo "- GoInstallBinaries"
