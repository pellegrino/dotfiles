# This file is sourced by all *interactive* bash shells on startup.  

# Aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d ~/bin ] ; then
    PATH="~/bin:${PATH}"
fi

# RVM 
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then . $HOME/.rvm/scripts/rvm ; fi

# Bashmarks
if [ -f ~/bin/bashmarks ] ; then
    . ~/bin/bashmarks
fi
export EDITOR='vim'
# RVM and Git information at terminal
export PS1='\w `~/.rvm/bin/rvm-prompt i v` `git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`\[\033[37m\]$\[\033[00m\] '

if test -s "/home/pellegrino/.profile" ; then . "/home/pellegrino/.profile" ; fi
