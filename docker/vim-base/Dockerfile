FROM ubuntu:18.04 as build

WORKDIR /tmp

# Installing dependencies
RUN apt update \
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
  ## VIM source
  && git clone https://github.com/vim/vim.git
# Building VIM
RUN cd vim \
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
  ## Producing a .deb
  && checkinstall \
  ### Specify to build a .deb
  -D \
  ### install & fstrans prevent installation
  --install=no \
  --fstrans=yes \
  ### The following four options affect output file name (vim_1-1_amd64.deb)
  --pkgname=vim \
  --pkgversion=1 \
  --pkgrelease=1 \
  --pkgarch=amd64

FROM ubuntu:18.04

# Installing dependencies
RUN apt update \
  && apt install -y \
  curl \
  ## Required by VIM plugins
  python3 \
  python3-pip \
  ## Required by VIM
  libsm6 \
  libxt6 \
  && pip3 install --upgrade pip==9.0.3 \
  ## Required by `deoplete`
  && pip3 install neovim

# Installing VIM
COPY --from=build /tmp/vim/vim_1-1_amd64.deb /tmp/vim.deb
RUN dpkg -i /tmp/vim.deb

# VIM setup
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY configs/vim /root/
# TODO(NilsG-S): run PlugInstall

# Configures container to run as an executable
ENTRYPOINT ["vim"]