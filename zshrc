ZSH=~/.zsh-extra
# Load all of the config files in ~/oh-my-zsh that end in .zsh
# Heavily influenced by oh-my-zsh

# Adding local/bin to path if it's available
if [[ -d $HOME/local/bin ]]  then
  PATH=$PATH:$HOME/local/bin
fi

# Adding /usr/local/bin to path if it's available
if [[ -d /usr/local/bin ]]  then
  PATH=/usr/local/bin:$PATH
fi

# Adding local/bin to path if it's available
if [[ -d /usr/local/sbin ]]  then
  PATH=$PATH:/usr/local/sbin
fi
# Adding local bin to path if it's available
if [[ -d $HOME/bin ]]  then
  PATH=$PATH:$HOME/bin
fi

# Adding local bin to path if it's available
if [[ -f $HOME/.lib/vimclojure/server-2.3.5.jar ]]  then
  export VIMCLOJURE_SERVER_JAR="$HOME/.lib/vimclojure/server-2.3.5.jar"
fi

for config_file ($ZSH/*.zsh) source $config_file

# used plugins
# TODO: make it autoload every plugin inside my plugins directory
plugins=(git zshmarks customaliases)


is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || test -f $base_dir/plugins/$name/_$name
}
# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
  if is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  fi
done

# Load and run compinit
autoload -U compinit
compinit -i


# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

export EDITOR=vim
fpath=(~/.zsh/Completion $fpath)

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
