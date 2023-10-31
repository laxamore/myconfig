#!/bin/bash

dotfiles=$(ls -F | grep /)

for folder in ${dotfiles[@]}; do
  if [ $folder == "bin/" ]; then
    stow -D -t ~/.local/bin/ $folder
  else
    stow -D -t ~/ $folder
  fi
done

sudo rm /usr/local/bin/xfce4-reload-settings
