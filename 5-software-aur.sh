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
    # WEB -----------------------------------------------------------------

    'xwayland-run'                # Dependency of librewolf
    'librewolf-bin'               # Web browser


    # UTILITIES -----------------------------------------------------------

    'dropbox'                     # Cloud file storage
)

sudo pacman -Syu
for PKG in "${PKGS[@]}"; do
    git clone https://aur.archlinux.org/"$PKG".git
    cd "$PKG"
    makepkg -src
    sudo pacman -U "$PKG"*.pkg.tar.zst
    cd ..
done

echo
echo "Done!"
echo
