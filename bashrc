# This file is sourced by all *interactive* bash shells on startup.  

# Aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# RVM 
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

