#!/bin/env bash

# clear log
rm install.log

run() {
  echo "----====----====---====$1====----====----====----====" >> install.log
  echo "----====----====---====$1====----====----====----===="
  $1 2>> install.log
}

get() {
  run "yay -S --noconfirm --needed --noredownload --norebuild $1"
}
