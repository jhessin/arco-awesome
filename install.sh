#!/usr/bin/env bash

# First update everything
sudo pacman -Scc --noconfirm &&
sudo pacman -Rdd --noconfirm libdmx libxxf86dga &&
sudo pacman -Syyu --noconfirm --needed &&
sudo pacman -Rdd --noconfirm xorgproto
yay -Syu --noconfirm --needed --noredownload --norebuild &&

# Now install awesome
./000-use-all-cores-makepkg-conf-v4.sh &&
./100-display-manager-and-desktop-v1.sh &&
./110-install-sound-v3.sh &&
./120-bluetooth-v2.sh &&
./121-fix-bluetooth-switch-not-working-v1.sh &&
./130-install-printers-v3.sh &&
./140-install-samba-v3.sh &&
./150-install-network-discovery-v4.sh &&
./160-install-tlp-for-laptops-v1.sh &&
./200-software-arch-linux-repo-v2.sh &&
./300-software-AUR-repo-v1.sh &&
./400-software-arch-linux-repo-distro-specific-v1.sh &&
./500-software-AUR-repo-distro-specific-v1.sh &&
./600-software-from-ArcoLinux-repo-v1.sh &&
./700-installing-fonts-v2.sh &&
./800-autologin-v3.sh &&
./900-fix-microcode-error-v1.sh &&
./910-fix-mouse-cursor-breeze-snow-v1.sh &&

echo "Be sure to run the scripts in system_setup"
