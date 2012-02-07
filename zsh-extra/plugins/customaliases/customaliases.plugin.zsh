function add-alias() {
  name=$1 
  value=$2

  custom_aliases_file="$ZSH/custom-aliases.zsh"

  # Create custom_aliases_file it if it doesn't exist
  if [[ ! -f $custom_aliases_file ]]; then
    touch $custom_aliases_file
  fi

  if [[ -z $name ]]; then
    echo "Invalid alias name, please provide a name for your alias."
    return 1
  fi

  if [[ -z $value ]]; then
    echo "Invalid alias value, please provide a value for your alias."
    return 1
  fi

  echo "alias $name='$value'" >> $custom_aliases_file
  eval "alias $name='$value'"
  alias $name

}
