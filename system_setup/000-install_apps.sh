#!/bin/bash

# Install

# install the necessary programs
source ../functions.sh
# get libreoffice-fresh &&

# Install python
get python &&
get python-pip &&
pip install --user neovim

# Install rvm, ruby, rails
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
\curl -sSL https://get.rvm.io | bash -s stable --rails

[[ -s "$HOME/.mkshrc" ]] && source "$HOME/.mkshrc" # add rvm to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
gem install neovim
gem install rubocop

# Install yarn
aurget yarn &&
yarn global add neovim

# i3lock and xautolock
aurget i3lock
aurget xautolock

# Install neovim
aurget neovim

# install synergy for mouse sharing
pacget synergy

# Install nvimpager and vimpager
aurget nvimpager
aurget vimpager

# install yarn stuff
yarn global add bash-language-server prettier stylelint eslint tslint

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
