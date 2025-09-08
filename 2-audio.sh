#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING AUDIO/BLUETOOTH COMPONENTS"
echo

PKGS=(
        'alsa-utils'        # Advanced Linux Sound Architecture (ALSA) Components https://alsa.opensrc.org/
        'alsa-plugins'      # ALSA plugins
        'pipewire'     	    # Multimedia framework
        'wireplumber'       # Session manager for pipewire
        'pipewire-audio'    # Audio server
        'pipewire-alsa'     # Routes ALSA API through pipewire
        'pipewire-pulse'    # Handles PulseAudio clients
        'pipewire-jack'     # Handles JACK clients
        'bluez'                 # Daemons for the bluetooth protocol stack
        'bluez-utils'           # Bluetooth development and debugging utilities
        'bluez-tools'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
