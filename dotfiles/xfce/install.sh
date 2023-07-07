#!/bin/bash

dotfiles=$(ls -F | grep /)

mkdir -p ~/.local/bin/

for folder in ${dotfiles[@]}; do
  if [ $folder != "etc/" ]; then
    if [ $folder == "bin/" ]; then
      stow -D -t ~/.local/bin/ $folder
      stow -t ~/.local/bin/ $folder
    else
      stow -D -t ~/ $folder
      stow -t ~/ $folder
    fi
  fi
done

sudo ln -s $(pwd)/etc/xdg /etc/xdg/xfce4
