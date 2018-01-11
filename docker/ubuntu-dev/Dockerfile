From ubuntu:16.04 

RUN cd ~ && \
  mkdir software && \
  cd software && \
  apt-add-repository ppa:deadsnakes/ppa && \
  apt-get update && \
  apt-get install -y \
    ncurses-dev \
    python3.6 && \
  python3.6 -m pip install neovim && \
  git clone https://github.com/vim/vim.git && \
  cd vim && \
  ./configure --with-features=huge \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local && \
  make && \
  make install && \
  cd ~ && \
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  cd software && \
  git clone https://github.com/NilsG-S/config.git && \
  cp config/configs/vim/.vimrc ~/.vimrc

# Remember to PlugInstall and GoInstallBinaries
