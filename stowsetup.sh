#!/bin/bash
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
# Reset
Color_Off='\033[0m'       # Text Reset

if ! [ -x "$(command -v stow)" ]; then
  echo -n -e '${Red}Error: '
  echo 'stow is not installed. Please install and rerun this script.' >&2
  exit 1
else
  # echo "Stow is installed." 
  echo "Please enter names of packages (separated from each other by a space) which you want to stow."
  declare -a packagearray
  read -a packagearray
  for package in "${packagearray[@]}"
  do
    # Check if folder is present in dotfiles. If not present then prompt error and exit.
    if ! [ -d "./$package/" ]; then
      echo -n -e "${Yellow}[warning] " 
      echo -n -e "${Color_Off}Dotfiles for " 
      echo -n -e "${Red}$package" 
      echo -e " ${Color_Off}not present!" >&2
    # If folder is present, check if symlink is present in ~/.config directory.
    else
      echo -n -e "${Green}[success] " 
      echo -n -e  "${Color_Off}Stowing "
      echo -n -e "${Color_Off}files for "
      echo -e "${Cyan}$package${Color_Off}..."
      # Check if config folder is already present
      if [ -d "${HOME}/.config/$package/" ]; then
        # If folder is just symlink, not an issue...
        # Otherwise create backup of existing config
        if [ -L "${HOME}/.config/$package/" ]; then
          stow $package
        else
          echo -n -e "${Yellow}[warning] "
          echo -e "${Color_Off}Config folder already present. Backing up existing config folder."
          mv ~/.config/$package ~/.config/$package.bak && stow $package
        fi
      else
        stow $package
      fi
    fi
  done
  # Delete array
  unset packagearray
fi
