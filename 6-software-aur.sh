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

PKGS=(
    # WEB -----------------------------------------------------------------

    'xwayland-run'                # Dependency of librewolf
    'librewolf-bin'               # Web browser


    # UTILITIES -----------------------------------------------------------

    'dropbox'                       # Cloud file storage
    'calcure'                       # TUI calendar
    'zoom'                          # Zoom
)

yay -Syu
for PKG in "${PKGS[@]}"; do
    cd "${HOME}/build"
    # TODO: Remove this check on fresh install and only use yay
    if [ -d "$PKG" ]; then 
        echo "Package $PKG already installed in ~/build/"
        continue
    fi
    yay "$PKG"
done

echo
echo "Done!"
echo
