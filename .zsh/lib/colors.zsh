# colors
autoload -U colors && colors

# ls colors (autocomplete)
zstyle ':completion:*' list-colors 'di=01;34:ln=35:so=32:pi=33:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

setopt auto_cd
setopt multios
setopt prompt_subst

[[ -n "$WINDOW" ]] && SCREEN_NO="%B$WINDOW%b " || SCREEN_NO=""

# git prompt theming
# ZSH_THEME_GIT_PROMPT_PREFIX="git:(" # Prefix at the very beginning of the prompt, before the branch name
# ZSH_THEME_GIT_PROMPT_SUFFIX=")" # At the very end of the prompt
# ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
