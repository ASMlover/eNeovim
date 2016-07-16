#!/usr/bin/env bash
#
# Copyright (c) 2014 ASMlover. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list ofconditions and the following disclaimer.
#
#  * Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materialsprovided with the
#    distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

app_name='eNeovim'
app_dir=$(cd `dirname $0`; pwd)
app_url='https://github.com/ASMlover/eNeovim.git'
plug_url='https://github.com/junegunn/vim-plug.git'

upgrade_repo() {
  echo "updating $1 ..."
  if [ $1 = $app_name ]; then
    cd $app_dir &&
      git pull
  fi
}

clone_repo() {
  echo "cloning eNeovim ..."
  if [ ! -e $app_dir/nvim ]; then
    app_dir=$HOME/$app_name
    git clone $app_url $app_dir
    cd $app_dir
  else
    upgrade_repo $app_name "successfully updated $app_name"
  fi
}

install_vim_plug() {
  if [ ! -d $HOME/.config/nvim/autoload ]; then
    mkdir -p $HOME/.config/nvim/autoload
  fi

  if [ ! -d $app_dir/vim-plug ]; then
    echo "cloning vim-plug ..."
    git clone $plug_url
  else
    echo "upgrading vim-plug ..."
    cd vim-plug && git pull && cd -
  fi
  cp $app_dir/vim-plug/plug.vim $HOME/.config/nvim/autoload
}

create_vimrc() {
  echo "creating configure for nvim ..."
  if [ ! -d $HOME/.config ]; then
    mkdir -p $HOME/.config
  fi
  if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
  fi

  install_vim_plug "successfully install vim-plug ..."

  cp $app_dir/nvim/init.vim $HOME/.config/nvim/
  if [ -d $HOME/.config/nvim/eNvim ]; then
    rm -rf $HOME/.config/nvim/eNvim
  fi
  cp -R $app_dir/nvim/eNvim $HOME/.config/nvim/
  cp -R $app_dir/extras/syntax $HOME/.config/nvim/
}

install_plugins() {
  echo "setting plugins for nvim ..."
  vim -u $HOME/.config/nvim/eNvim/el-install.vim +PlugInstall +qall
}

do_install() {
  clone_repo      "successfully cloned" $app_name
  create_vimrc    "setting up vimrc"
  install_plugins "now updating/installing plugins using vim-plug"
  echo 'installing eNeovim successfully ...'
}

do_uninstall() {
  echo "starting uninstall eNeovim ..."
  rm -rf $HOME/.config/nvim
  echo "uninstall successfully ..."
}

case "$1" in
  'install')
    do_install
    ;;
  'uninstall')
    do_uninstall
    ;;
  *)
    echo "USAGE: $0 {install|uninstall}"
    exit 3
    ;;
esac

exit 0
