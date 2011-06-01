# This file is sourced by all *interactive* bash shells on startup.  

# Aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d ~/bin ] ; then
    PATH="~/bin:${PATH}"
fi


# RVM 
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# Bashmarks
if [ -f ~/bin/bashmarks ] ; then
    . ~/bin/bashmarks
fi


