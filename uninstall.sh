#!/bin/bash

dotfiles=$(ls -F | grep /)

for folder in ${dotfiles[@]}; do
	stow -D -t ~/ $folder
done
