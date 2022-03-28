#!/bin/bash

dotfiles=$(ls -F | grep /)

for folder in ${dotfiles[@]}; do
  if [ $folder == "bin/" ]; then
    stow -D -t ~/.local/bin/ $folder
    stow -t ~/.local/bin/ $folder
  else
    stow -D -t ~/ $folder
    stow -t ~/ $folder
  fi
done
