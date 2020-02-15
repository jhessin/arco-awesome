#!/usr/bin/env bash

# clear log
rm install.log

run() {
  echo "----====----====---====$1====----====----====----====" >> install.log
  echo "----====----====---====$1====----====----====----===="
  $1 2>> install.log
}

# first run update fix
# by removing obsolete packages
run "sudo pacman -Scc --noconfirm"
run "sudo pacman -Rdd --noconfirm libdmx libxxf86dga"

# update everything
run "sudo pacman -Syyu --noconfirm --needed"
run "sudo pacman -Rdd --noconfirm xorgproto"
run "yay -Syu --noconfirm --needed --noredownload --norebuild"

# Now install awesome
run ./000-use-all-cores-makepkg-conf-v4.sh
run ./100-display-manager-and-desktop-v1.sh
run ./110-install-sound-v3.sh
run ./120-bluetooth-v2.sh
run ./121-fix-bluetooth-switch-not-working-v1.sh
run ./130-install-printers-v3.sh
run ./140-install-samba-v3.sh
run ./150-install-network-discovery-v4.sh
run ./160-install-tlp-for-laptops-v1.sh
run ./200-software-arch-linux-repo-v2.sh
run ./300-software-AUR-repo-v1.sh
run ./400-software-arch-linux-repo-distro-specific-v1.sh
run ./500-software-AUR-repo-distro-specific-v1.sh
run ./600-software-from-ArcoLinux-repo-v1.sh
run ./700-installing-fonts-v2.sh
run ./800-autologin-v3.sh
run ./900-fix-microcode-error-v1.sh
run ./910-fix-mouse-cursor-breeze-snow-v1.sh

echo "Be sure to run the scripts in system_setup"
