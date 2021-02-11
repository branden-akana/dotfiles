#!/bin/sh

cmd="nvim ${@// /\\ }"

termite -e "bash -lic \"$cmd\""
