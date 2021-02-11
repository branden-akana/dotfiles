#!/bin/sudo sh

# remove uninstalled cached packages and sync database
pacman -Sc

# this variant will completely clean the cache
# pacman -Scc

# remove orphan packages
pacman -Rns $(pacman -Qtdq)
