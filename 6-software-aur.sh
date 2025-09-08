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

    'librewolf'                   # Web browser


    # UTILITIES -----------------------------------------------------------

    'dropbox'                     # Cloud file storage
)

for PKG in "${PKGS[@]}"; do
    ./auric.sh -i $PKG
    # TODO: Fix this install script
done

echo
echo "Done!"
echo
