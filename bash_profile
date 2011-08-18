if [ $HOME/.bashrc ];then
   . $HOME/.bashrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if test -s "/home/pellegrino/.bashrc" ; then . "/home/pellegrino/.bashrc" ; fi
export projects_path="$HOME/projects"
[[ -s "/usr/local/bdsm/modules/bash/project/interactive" ]] && source "/usr/local/bdsm/modules/bash/project/interactive"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

