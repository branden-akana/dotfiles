#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#----------------------------------------------------------------------------
#   ssh agent
#----------------------------------------------------------------------------

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_rsa 2> /dev/null

#----------------------------------------------------------------------------
#   prompt
#----------------------------------------------------------------------------

PS1='\n${debian_chroot:+($debian_chroot)}\[\033[07;34m\] \u \[\033[07;39m\] \w \[\033[00m\] '

#----------------------------------------------------------------------------
#   utility fns
#----------------------------------------------------------------------------

=() {
	echo "$(($@))"
}

#----------------------------------------------------------------------------
#   variables
#----------------------------------------------------------------------------

export XDG_CONFIG_HOME=~/.config

