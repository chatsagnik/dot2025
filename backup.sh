#!/bin/bash
# The following line extracts packages that were manually installed from the AUR and puts them into the packagelist file.
pacman -Qqet | grep -v "$(pacman -Qqm)" > ./package.lst
# The following lines installs packages from the file packagelist, based on the available package manager. This command must be run as sudo. 
# Check for package manager
YUM_CMD=$(which yum)
DNF_CMD=$(which dnf)
APT_CMD=$(which apt-get)
PACMAN_CMD=$(which pacman)

if [ ! -z $PACMAN_CMD ]; then
  cat ./package.lst | xargs pacman -S --needed --noconfirm
  pacman -Syu
elif [ ! -z $APT_CMD ]; then
  cat ./package.lst | xargs apt-get -y install
  apt-get update && apt-get upgrade && apt-get autoremove && apt-get autoclean
elif [ ! -z $DNF_CMD ]; then
  cat ./package.lst | xargs dnf install -y
elif [ ! -z $YUM_CMD ]; then
  cat ./package.lst | xargs yum install -y
fi

# For local backup, one can use the following commands:
# pacman -S --needed --noconfirm $(pacman -Qqe | grep -v "$(pacman -Qqm)")
