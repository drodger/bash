# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
#alias tmux="TERM=screen-256color-bce tmux -2"
alias pg='cd /usr/local/programs'
alias an='cd ~/code/ansible'
alias ad='cd /var/www/erezadmin'
alias ez='cd /var/www/erezlife'
alias dev='cd /var/www/erezlife/development'
alias misc='cd ~/code/misc'
alias edb='cd ~/Downloads/erez_db'
alias hx='hexdump -C'
alias tv='cd /media/derek/TV'
alias movie='cd /media/derek/MOVIES'
alias apps='cd /media/derek/APPS'
alias :e='nvim'
alias nv='cd ~/.config/nvim'
alias n='nvim'
alias v='nvim'
alias c='clear'
alias s='sudo'
alias nq='nvim-qt'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
