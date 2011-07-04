# Adds an alias to the current shell and to this file.
# Borrowed from Mislav (http://github.com/mislav/dotfiles/tree/master/bash_aliases)
add-alias ()
{
   local name=$1 value=$2
   echo "alias $name='$value'" >> ~/.bash_aliases
   eval "alias $name='$value'"
   alias $name
}
 export LS_COLORS='no=00:fi=00:di=00;36:ln=00;35:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;31:'

alias gs='git status'
alias gc='git commit'
alias gb='git branch -a -v'
alias ls='ls -la' 
alias bi='bundle install'
alias gl='git log'
alias gco='git checkout master'
alias bu='bundle update
'
alias be='bundle exec'
alias gss='git submodule status'
alias gsa='git submodule add'
