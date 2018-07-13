# Initializes Oh My Zsh

# add a function path
fpath=($OMZ/functions $OMZ/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

# Set OMZ_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$OMZ_CUSTOM" ]]; then
    OMZ_CUSTOM="$OMZ/custom"
fi

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($OMZ/lib/*.zsh); do
  custom_config_file="${OMZ_CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || test -f $base_dir/plugins/$name/_$name
}
for plugin ($plugins); do
  if is_plugin $OMZ_CUSTOM $plugin; then
    fpath=($OMZ_CUSTOM/plugins/$plugin $fpath)
  elif is_plugin $OMZ $plugin; then
    fpath=($OMZ/plugins/$plugin $fpath)
  fi
done

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

# Save the location of the current completion dump file.
if [ -z "$OMZ_COMPDUMP" ]; then
  OMZ_COMPDUMP="$OMZ/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  # If completion insecurities exist, warn the user
  if ! compaudit &>/dev/null; then
    handle_completion_insecurities
  fi
  # Load only from secure directories
  compinit -i -d "${OMZ_COMPDUMP}"
else
  # If the user wants it, load from all found directories
  compinit -u -d "${OMZ_COMPDUMP}"
fi

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $OMZ_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $OMZ_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $OMZ/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $OMZ/plugins/$plugin/$plugin.plugin.zsh
  fi
done

