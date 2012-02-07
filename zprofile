source ~/.zshrc

# Adding local bin to path if it's available 
if [[ -d $HOME/bin ]]  then
  PATH=$HOME/bin:$PATH
fi


