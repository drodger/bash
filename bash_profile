# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
eval `keychain --eval id_rsa`
eval `keychain --eval pm_github_rsa`

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# export PATH="/home/derek/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
