#!/bin/env bash

# clear log
rm install.log

function run {
  echo "----====----====---====$1====----====----====----====" >> install.log
  echo "----====----====---====$1====----====----====----===="
  $1 2>> install.log
}

function get {
  run "yay -S --noconfirm --needed --noredownload --norebuild $1"
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
