#!/bin/env bash

source ../functions.sh

run ./100-install-personal-folders-v1.sh
run ./200-install-personal-bookmarks-v1.sh
run ./300-firefox-fix-unreadable-text-for-dark-themes-settings-v2.sh
run ./400-zsh-software-themes-v1.sh
