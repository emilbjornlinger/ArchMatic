#!/usr/bin/env bash

chezmoi init git@github.com:emilbjornlinger/dotfiles.git

read -n1 -p "Check the Chezmoi website on how to apply the dotfiles to your local storage and working with the remote repo. Enter any key to continue [*]" doit
case $doit in
    *)
        echo -e "\nContinuing"
        ;;
esac
