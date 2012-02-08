# README
Those are my configurations. 

## How to install in a new machine
Given that this is a new blankslate machine, some steps are required to make it into a fully operational dev workstation to my likings :P 

## Pre-requisites
  * Rake (for the installer task)
  * Zsh

### Ubuntu
TODO: Point directions to install each one of these dependencies 

 * Install git
 * Install curl (for rvm)
 * Install ruby 
 * Install vim 
 * Install zsh 


#### Zsh

You may want to set zsh as your default shell using the following command
     chsh -s /bin/zsh

#### Irssi

This requires some additional packages. 

  * Autossh - Used to estabilish a persistent connection with my vps used to create IRC desktop notifications 
  * Socat 
  * Create the service daemon for listening to notifications


#### Vim GIST 

You have to export in your .zshrc (check zsh-extra/github\_keys.zsh.example) file both variables GITHUB\_USER and GITHUB\_TOKEN.
Since those are sensitive data, its not a good idea to share this information publicly 

### Mac OSX
 * Install homebrew
 * Install XCode 
 * Install Git (brew install git bash-completion) 
 * Install RVM


