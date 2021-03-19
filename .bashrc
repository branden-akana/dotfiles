#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#----------------------------------------------------------------------------
#   startup tasks
#----------------------------------------------------------------------------

# start SSH agent

#eval $(ssh-agent -s)
#ssh-add ~/.ssh/id_rsa

# https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# imports wal colorscheme

(cat ~/.cache/wal/sequences &)

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



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
#        . "/usr/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

