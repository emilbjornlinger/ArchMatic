#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "${HOME}/build"


PKGS=(
    # YAY -----------------------------------------------------------------

    'yay'                       # AUR helper
)

sudo pacman -Syu
for PKG in "${PKGS[@]}"; do
    if [ -d "$PKG" ]; then 
        echo "Package $PKG already installed in ~/build/"
        continue
    fi
    git clone https://aur.archlinux.org/"$PKG".git
    cd "$PKG"
    makepkg -src
    sudo pacman -U "$PKG"*.pkg.tar.zst
    cd ..
done

echo
echo "Done!"
echo
