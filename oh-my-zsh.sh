# Initializes Oh My Zsh

# add a function path
fpath=($OMZ/functions $OMZ/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$OMZ/custom"
fi

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($OMZ/lib/*.zsh); do
  custom_config_file="${ZSH_CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="$OMZ/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $OMZ/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $OMZ/plugins/$plugin/$plugin.plugin.zsh
  fi
done

