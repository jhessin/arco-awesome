#!/bin/bash
# set -e
echo "One or more packages are coming from AUR as source."
echo "If a package from AUR fails to install, all other packages after that will NOT be installed."
echo "We put the set -e for you to notice some package broke the script and you can intervene manually."
echo "Put a hashtag in front of set -e to keep installing (the rest) even if there is an error."
echo "Then figure out how to get the broken package installed or leave it until the maintainer from AUR"
echo "will fix it for you. Give it some time."
sleep 3
cd "$(dirname "$0")"
source functions.sh
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# software from AUR (Arch User Repositories)
# https://aur.archlinux.org/packages/

#giving tmp folder extra gb in order not to run out of disk space while installing software
#only if you run into issues with that
#sudo mount -o remount,size=5G,noatime /tmp

echo "Installing category Accessories"

sh AUR/install-conky-lua-archers-v*.sh
sh AUR/install-mintstick-git-v*.sh

echo "Installing category Development"

# sh AUR/install-sublime-text-v*.sh
pacget python &&
  pacget python-pip &&
  pip install --user neovim
pip install --user powerline-status &&
  pacget powerline

echo "Installing category Education"

echo "Installing category Games"

sh AUR/install-steam*.sh

echo "Installing category Graphics"

echo "Installing category Internet"

sh AUR/install-enpass-v*.sh

echo "Installing category Multimedia"

# sh AUR/install-gradio-v*.sh
# sh AUR/install-peek-v*.sh
# sh AUR/install-radiotray-v*.sh
pacget vlc

echo "Installing category Office"

pacget zathura
pacget zathura-pdf-mupdf

echo "Installing category Other"

echo "Installing category System"

pacget vifm
sh AUR/install-downgrade-v*.sh
sh AUR/install-font-manager-git-v*.sh
sh AUR/install-inxi-v*.sh
sh AUR/install-neofetch-v*.sh
sh AUR/install-numix-circle-icon-theme-git-v*.sh
sh AUR/install-oxy-neon-v*.sh
sh AUR/install-pamac-aur-v*.sh
#sh AUR/install-paper-icon-theme-git-v*.sh
#sh AUR/install-papirus-icon-theme-git-v*.sh
sh AUR/install-sardi-icons-v*.sh
sh AUR/install-sardi-extra-icons-v*.sh
sh AUR/install-screenkey-git-v*.sh
sh AUR/install-surfn-icons-git-v*.sh
sh AUR/install-the-platinum-searcher-bin-v*.sh
sh AUR/install-ttf-font-awesome-v*.sh
sh AUR/install-ttf-mac-fonts-v*.sh
sh AUR/install-virtualbox-for-linux-v*.sh
sh AUR/install-xcursor-breeze-v*.sh

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
aurget i3lock
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

# these come always last

sh AUR/install-hardcode-fixer-git-v*.sh
sudo hardcode-fixer

echo "################################################################"
echo "####        Software from AUR Repository installed        ######"
echo "################################################################"
