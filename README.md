# dotfiles

## Zsh

I'm using zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

To use my zsh config fill in your home directory in the variable at line 3.

[View zsh config](zshrc) - `~/.zshrc`

[View oh-my-zsh config](oh-my-zsh.sh) - `~/.oh-my-zsh/oh-my-zsh.sh`

[View aliases](aliases.zsh) - `~/.oh-my-zsh/custom/aliases.zsh`

### Zsh theme

[View zsh-theme](cobalt2.zsh-theme) - `~/.oh-my-zsh/themes/cobalt2.zsh-theme`

For the theme to be rendered correctly you will need a [powerline patched font](https://github.com/robbyrussell/oh-my-zsh).
The font will need to be installed on the device and activated in the iTerm options: `Profiles > Text > Font > Change Font`.

To change the `$` default prompt in the shell, open `~/.oh-my-zsh/themes/cobalt2.zsh-theme` and edit line 52, changing the value between the closing parens and double quote:

```zsh
prompt_segment black default "%(!.%{%F{yellow}%}.)<insert-prompt-here>"
```

### Colorscheme

**OSX only:**

[View iTerm colorscheme](Brogrammer.itermcolors)

The iTerm colorscheme will need to imported in the iTerm options: `Profiles > Colors > Color Presets > Import` and selected in the same dropdown after the import.

### Plugins

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Clone into `~/.oh-my-zsh/plugins/` with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

- [z (jump around)](https://github.com/rupa/z) (already downloaded with oh-my-zsh)

## Eslint

[View eslint config](eslintrc) - `~/.eslintrc`

Requires `eslint` and `eslint-config-airbnb` to be installed globally:

```zsh
npm i eslint -g
npm i eslint-config-airbnb -g
```

## Vim

[View vim config](vimrc) - `~/.vimrc`

[View colorscheme](https://github.com/j-tom/vim-old-hope)

### Plugins

- [NERDTree](https://github.com/scrooloose/nerdtree)
- [MiniBufExpl](https://github.com/fholgado/minibufexpl.vim)
