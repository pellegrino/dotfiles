function add-alias() {
  name=$1 
  value=$2

  if [[ -z $name ]]; then
    echo "Invalid alias name, please provide a name for your alias."
    return 1
  fi

  if [[ -z $value ]]; then
    echo "Invalid alias value, please provide a value for your alias."
    return 1
  fi

  echo "alias $name='$value'" >> ~/.zsh-extras/custom-aliases.zsh
  eval "alias $name='$value'"
  alias $name

}
