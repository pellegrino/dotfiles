# This file is sourced by all *interactive* bash shells on startup.  

export NODE_PATH="/usr/local/lib/node_modules"

# Aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d ~/bin ] ; then
    PATH="~/bin:${PATH}"
fi
if [ -d /usr/local/share/npm/bin ] ; then
  PATH="/usr/local/share/npm/bin:${PATH}" 
fi 
# RVM 
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then . $HOME/.rvm/scripts/rvm ; fi

# Bashmarks
if [ -f ~/bin/bashmarks ] ; then
    . ~/bin/bashmarks
fi

# git completion
if [ -f ~/.git-completion.bash ] ; then
    . ~/.git-completion.bash
fi
export EDITOR='vim'
# RVM and Git information at terminal
export PS1='\w `~/.rvm/bin/rvm-prompt i v` `git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`\[\033[37m\]$\[\033[00m\] '

#if test -s "/home/pellegrino/.profile" ; then . "/home/pellegrino/.profile" ; fi

