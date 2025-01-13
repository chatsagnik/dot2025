#!/bin/bash
# The following line extracts packages that were manually installed from the AUR and puts them into the packagelist file.
pacman -Qqet | grep -v "$(pacman -Qqm)" > ./package.lst
# The following line installs packages from the file packagelist. This command must be run as sudo. 
cat ./package.lst | xargs pacman -S --needed --noconfirm

# For local backup, one can use the following commands:
# pacman -S --needed --noconfirm $(pacman -Qqe | grep -v "$(pacman -Qqm)")
