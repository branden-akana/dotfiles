#!/usr/bin/bash

bspc node -t floating
bspc node -z top 0 490

clear
echo -n ": "

read cmd

eval $cmd

exit 0
