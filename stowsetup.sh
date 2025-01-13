#!/bin/bash
if ! [ -x "$(command -v stow)" ]; then
  echo 'Error: stow is not installed. Please install and rerun this script.' >&2
  exit 1
else
  echo "Stow is installed. Please enter names of packages (separated from each other by a space) which you want to stow."
  declare -a packagearray
  read -a packagearray
  for package in "${packagearray[@]}"
  do
    echo "$package"
    # Check if folder is present in dotfiles. If not present then prompt error and exit.
    if ! [ -d "./$package/" ]; then
      echo -n 'Error: Dotfiles for ' 
      echo -n "$package" 
      echo ' not present! Please add dotfiles to continue.' >&2
      exit 1
    # If folder is present, check if symlink is present in ~/.config directory.
    else
      echo -n 'Dotfiles for '
      echo -n "$package"
      echo " present! Performing stow operation!"
      stow $package
    fi
  done
  # Delete array
  unset packagearray
fi
