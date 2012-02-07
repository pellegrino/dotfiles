# Load all of the config files in ~/oh-my-zsh that end in .zsh
# Heavily influenced by oh-my-zsh
for config_file (~/.zsh-extra/*.zsh) source $config_file


# Loads my plugins 

fpath=(~/.zsh-extra/plugins $fpath)

autoload -Uz compinit
compinit -i

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'


# End of lines added by compinstall
