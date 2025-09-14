# Installation Guide

This guide are the steps needed to do a base installation of Arch Linux and set it up for the automatic post-installation scripts contained in this repo.

---
Follow the installation guide on the Arch wiki. During the arch-chroot session, install the following software before rebooting:

- `# pacman -S iwd`
- Start/enable the iwd.service
- Create /etc/iwd/main.conf and put the following content in it:

"/etc/iwd/main.conf"
```
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
```

- Start/Enable the systemd-resolved.service
- Run `# rm /etc/resolv.conf && ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf`
- Connect to the internet using `$ iwctl`, see instructions on wiki page

- vim
- grub
    - Configure grub according to wiki page and specific hardware

## After boot to system

## 1 User account
- Install `sudo`
- Run `# useradd -m <name>`
- Run `# passwd <name>`
- Run `# export EDITOR=vim`
- Run `# visudo /etc/sudoers`
- Add "<name> ALL=(ALL:ALL) ALL" to the sudoers file
- Shutdown and log back in to user account

## 2 Services and base
- Install `reflector`
- Start reflector.service
- Install `base-devel`
- Install `git`
- Install rebuild-detector from AUR, from source, no helper:
    - `$ cd && mkdir build && cd build`
    - `$ git clone https://aur.archlinux.org/rebuild-detector.git`
    - `$ cd rebuild-detector && makepkg -src`
    - Look at the error message and search and import the key for the user-id using `$ gpg --search-keys <user-id>`
    - Then run `$ gpg --refresh-keys>`
    - `$ makepkg -src`
    - `$ pacman -U <package-name>.pkg.tar.zst`

**Note** Run checkrebuild command once in a while to see outdated packages that need to be rebuilt

- Setup hibernation (specific for BIOS with MBR):
- Find the UUID of the swap partition: `$ lsblk -f`
- Edit "/etc/default/grub and add "resume=UUID=<UUID>" to the GRUB\_CMDLINE\_LINUX\_DEFAULT="" string, i.e. "loglevel=3 quiet resume=UUID=<UUID>"
- Run `$ sudo grub-mkconfig -o /boot/grub/grub.cfg`
- Edit "/etc/mkinitcpio.conf" and add "resume" after "udev" and before "filesystems" in the HOOKS=() entry
- Regenerate `$ sudo mkninitcpio -P`
- After a reboot the hibernation should work

- Reboot
