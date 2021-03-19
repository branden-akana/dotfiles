#!/bin/sh

cmd="vim +Goyo $@"

termite -e "bash -lic \"$cmd\""
