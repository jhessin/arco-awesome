#!/bin/env bash

# clear log
rm -f install.log

function run {
  echo "----====----====---====$1====----====----====----====" >> install.log
  echo "----====----====---====$1====----====----====----===="
  $1 2>> install.log
}

function confirm {
  # prompt for continue, or cancel
  echo -n "$1(y/N)?"
  old_stty_cfg=$(stty -g)
  stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Caution

  if echo "$answer" | grep -iq "^y" ;then
    echo \n
    return 0 # true
  else
    echo \n
    return 1 # false
  fi
}

function clean {
  git reset --hard
  git clean -f -d
}

function pacget {
  package="$1"
  if pacman -Qi $package &> /dev/null; then

    tput setaf 2
    echo "################################################################"
    echo "################## "$package" is already installed"
    echo "################################################################"
    tput sgr0

  else

    tput setaf 3
    echo "################################################################"
    echo "######### Installing with pacman"
    echo "################################################################"
    tput sgr0
    sudo pacman -S --noconfirm --needed $package
  fi
}

function aurget {
  package="$1"

  #----------------------------------------------------------------------------------

  #checking if application is already installed or else install with aur helpers
  if pacman -Qi $package &> /dev/null; then

    tput setaf 2
    echo "################################################################"
    echo "################## "$package" is already installed"
    echo "################################################################"
    tput sgr0

  else

  #checking which helper is installed
  if pacman -Qi yay &> /dev/null; then

    tput setaf 3
    echo "################################################################"
    echo "######### Installing with yay"
    echo "################################################################"
    tput sgr0

    yay -S --noconfirm $package

  elif pacman -Qi trizen &> /dev/null; then

    tput setaf 3
    echo "################################################################"
    echo "######### Installing with trizen"
    echo "################################################################"
    tput sgr0
    trizen -S --noconfirm --needed --noedit $package

  fi

  fi


  # Just checking if installation was successful
  if pacman -Qi $package &> /dev/null; then

    tput setaf 2
    echo "################################################################"
    echo "#########  Checking ..."$package" has been installed"
    echo "################################################################"
    tput sgr0

  else

    tput setaf 1
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "!!!!!!!!!  "$package" has NOT been installed"
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    tput sgr0

  fi

#----------------------------------------------------------------------------------

}
