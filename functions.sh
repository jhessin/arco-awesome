#!/bin/env zsh

# clear log
rm -f install.log

function run {
  echo "----====----====---====$1====----====----====----====" >> install.log
  echo "----====----====---====$1====----====----====----===="
  $1 2>> install.log
}

source ~/.functions.sh
