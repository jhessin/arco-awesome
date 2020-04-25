#!/usr/bin/env bash

cd "$(dirname "$0")"
source functions.sh

pacget python &&
  pacget python-pip &&
  pip install --user neovim
pip install --user powerline-status &&
  pacget powerline

echo "Installing category Multimedia"

pacget vlc

echo "Installing category Office"

pacget zathura
pacget zathura-pdf-mupdf

echo "Installing vifm file manager"

pacget vifm

echo "Installing rvm, ruby, and rails"

gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
  7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
  \curl -sSL https://get.rvm.io | bash -s stable --rails

[[ -s "$HOME/.mkshrc" ]] && source "$HOME/.mkshrc"                   # add rvm to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
gem install neovim
gem install rubocop
gem install tmuxinator

# Installing yarn
aurget yarn &&
  yarn global add neovim

# i3lock and xautolock
aurget i3lock-color
aurget xautolock

# Install neovim
aurget neovim

# install synergy for mouse sharing
pacget synergy

# install vifm
pacget vifm

# Install nvimpager and vimpager
aurget nvimpager
aurget vimpager

# install yarn stuff
yarn global add bash-language-server prettier stylelint eslint tslint

# install teamviewer
aurget teamviewer
sudo systemctl enable teamviewerd

# install emby-server
aurget emby-server
sudo systemctl enable emby-server

# setup zsh as the default?
if confirm "Would you like to set up zsh"; then
  chsh -s $(which zsh)
fi

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install pluckeye
sudo ./pluckeye-linux-0.98.15.installer

# install solaar
pacget solaar

# install mouse cursors
pacget xcursor-themes

# install hub for github
pacget hub
