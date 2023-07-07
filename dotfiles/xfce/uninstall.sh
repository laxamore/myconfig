#!/bin/bash

dotfiles=$(ls -F | grep /)

for folder in ${dotfiles[@]}; do
  if [ $folder != "etc/" ]; then
    if [ $folder == "bin/" ]; then
      stow -D -t ~/.local/bin/ $folder
    else
      stow -D -t ~/ $folder
    fi
  fi
done

test -L /etc/xdg/xfce4
if [ $? -eq 0 ]; then
  sudo rm /etc/xdg/xfce4
fi