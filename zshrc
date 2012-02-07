# Load all of the config files in ~/oh-my-zsh that end in .zsh
# Influenced by oh-my-zsh
for config_file (~/.zsh-extra/*.zsh) source $config_file

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit -i


# End of lines added by compinstall
