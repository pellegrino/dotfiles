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


export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

if [ `sudo iptables -t nat -L | grep 20559 | wc -l` -eq 0 ]
  sudo iptables -t nat -A OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 20559
fi
