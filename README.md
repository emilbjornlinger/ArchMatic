# Arch Linux Post Installation Setup and Config Scripts

### System Description
I run ... (window manager/wayland)

No greeter is installed ...

Slimlock ... 

To boot I use ...

---

The install steps are as follows:

### Install Arch Linux

Follow the steps in ArchLinuxInstallationGuide.md then

---

### Boot into new installation
And get online...

    $   sudo wifi-menu

---

### Setup fastest mirrors

    $ <cmds>

---

### Initialize .gitconfig file
So we can clone this repo...

    $ git config --global user.name "your-username"
    $ git config --global user.email "your-email@gmail.com"
    $ <other cmds>

---

### Clone ArchMatic
Typically I just clone it into the home folder and delete it once I'm done.

    $   git clone git@github.com/emilbjornlinger/ArchMatic.git

---

### Run ArchMatic files
Run the following scripts:

    $   ./1-xorg.sh
    $   ./2-xfce.sh 
    $   ./3-network.sh 
    $   ./4-bluetooth.sh 
    $   ./5-audio.sh 
    $   ./6-printers.sh 
    $   ./7-software-pacman.sh
    $   ./8-software-aur.sh
    $   ./9-setup.sh
    TODO Edit this list after editing files

### Reboot

    $   reboot

### Initialize Wayland/Window Manager:
At the terminal, run:

    $   <???>

On subsequent logins use:

    $   <???>

