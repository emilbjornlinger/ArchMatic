# Arch Linux Post Installation Setup and Config Scripts

### System Description
I run sway with lemurs as a login manager.

Swaylock is the lock manager.

To boot I use GRUB(2).

---

The install steps are as follows:

### Install Arch Linux

Follow the steps in ArchLinuxInstallationGuide.md then

---

### Setup ssh keys and git

- `$ ssh-keygen -t ed25519`
- Add key to ssh-agent: `$ eval "$(ssh-agent -s) && ssh-add ~/.ssh/id_ed25519"`
- Add key to GitHub
- Setup git:
- `$ git config --global user.name "your-username"`
- `$ git config --global user.email "your-email@gmail.com"`

---

### Clone ArchMatic
Clone into the .config folder in order to be able to make changes to it.

- `$ cd ~/.config`
- `$ git clone git@github.com:emilbjornlinger/ArchMatic.git`
- `$ cd ArchMatic`

---

### Run ArchMatic files
Run the following scripts:

    $ ./1-graphical.sh
    $ ./2-power-management.sh 
    $ ./3-audio.sh 
    $ ./4-network.s
    $ ./5-software-pacman.sh
    $ ./6-software-aur.sh
    $ ./setup.sh
    $ ./dotfiles-setup.sh

**Note** The setup.sh file should contain all the setup that is done to the system so that it can be run several times in order to update the setup configuration. All other files should only install needed software.

**Note** The dotfiles-setup.sh can be run several times in order to apply the dotfiles from chezmoi, will do some type of setup TODO

### Reboot

`$ reboot`

### Initialize Wayland/Window Manager:

**TODO**

At the terminal, run:

`$ WHAT`

On subsequent logins use:

`$ WHAT`
