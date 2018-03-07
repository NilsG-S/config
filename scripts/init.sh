#!/bin/bash

if [ -z "$1" ] ; then
  echo "Error: supply username as an argument"
  exit 1
fi

user=$1

cd ~
sudo -u $user mkdir downloads
cd downloads

echo -e "Installing dependencies...\n"

apt install -y python3-pip
pip3 install --upgrade pip
pip3 install sh

echo -e "Execute \`vim.py\` to finish setup\n"
