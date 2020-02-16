#!/bin/bash

# Install

# install the necessary programs
source ../functions.sh
# get libreoffice-fresh &&

# Install python
get python &&
get python-pip &&

# Install rvm, ruby, rails
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
\curl -sSL https://get.rvm.io | bash -s stable --rails &&
gem install neovim --user

# Install yarn
get yarn
yarn global add neovim

# i3lock and xautolock
get i3lock &&
get xautolock

# Install neovim
get neovim &&
pip install --user neovim &&
$HOME/.config/nvim/install.sh &&

# Install nvimpager and vimpager
get nvimpager
get vimpager
