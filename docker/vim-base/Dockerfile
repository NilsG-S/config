FROM ubuntu:18.04 as build

WORKDIR /tmp

RUN apt update \
  # Installing dependencies
  && apt install -y \
  git \
  checkinstall \
  ## VIM general dependencies
  libncurses5-dev \
  ## X11 clipboard?
  libx11-dev \
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
  ## Produces a .deb and installs it
  && checkinstall