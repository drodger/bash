# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
        color_prompt=yes
        c_reset=`tput sgr0`
        c_user=`tput setaf 2; tput bold`
        c_path=`tput setaf 4; tput bold`
        c_git_clean=`tput setaf 2`
        c_git_dirty=`tput setaf 1`
    else
        color_prompt=
    fi
fi


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

vman() {
    vim -c "SuperMan $*"
    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

export PATH=$HOME/bin/:/usr/local/bin:$PATH:/usr/local/mysql/bin:/usr/local/programs/bin/:/home/derek/.local/bin
# export PATH=/home/derek/Programs/anaconda3/bin:$PATH
export MOZILLA_HOME=~/.mozilla
# export GREP_OPTIONS='--exclude tags --exclude-dir=.hg --exclude-dir=.git --exclude *.pyc --color=always'
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
# export DATA_DIR=/home/derek/Downloads/erez_db
export PAGER=most
export MANPAGER=$PAGER
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config
export EDITOR=nvim
export PY="assignment characteristics communication core erezauth erezcalendar erezlife exports formbuilder imports lottery residence reslife roomeez scripts shell staffapp touchnet"
export FZF_DEFAULT_COMMAND='rg --files'

. ~/.bash_prompt


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

# added by Anaconda3 installer
export PATH="/home/derek/anaconda3/bin:$PATH"
. /home/derek/anaconda3/etc/profile.d/conda.sh
