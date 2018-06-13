FROM ubuntu:18.04 as build

WORKDIR /tmp

RUN apt update \
  # Installing dependencies
  && apt install -y \
  git \
  ## VIM general dependencies
  libncurses5-dev \
  libgnome2-dev \
  libgnomeui-dev \
  libgtk2.0-dev \
  libatk1.0-dev \
  libbonoboui2-dev \
  libcairo2-dev \
  libx11-dev \
  libxpm-dev \
  libxt-dev \
  ## VIM specific dependencies
  python3-dev \
  # Building vim
  && git clone https://github.com/vim/vim.git \
  && cd vim \
  ## Known "good" release
  && git checkout 52d3aaeea4c85406f46e2051729e4f007f83b35e -b build \
  && ./configure \
  ## Affects later feature-flags
  --with-features=huge \
  ## Unicode support
  --enable-multibyte \
  ## Important for supporting certain plugins
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ \
  ## Command line only
  --enable-gui=no \
  ## Not interfacing with NetBeans
  --disable-netbeans \
  && make \
  && make install