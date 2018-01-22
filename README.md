# dotfiles

## Zsh

[View config](zshrc)

To use my `.zshrc` fill in your home directory in the variable at line 3.

### Zsh theme

[View zsh-theme](cobalt2.zsh-theme)


To install a zsh-theme [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is required.
After installing oh-my-zsh put the the zsh-theme into `~/.oh-my-zsh/themes/`.

For it to be rendered correctly one will need a [powerline patched font](https://github.com/robbyrussell/oh-my-zsh).
The font will need to be installed on the device and activated in the iTerm options: `Profiles > Text > Font > Change Font`.

To change the `$` default prompt open `~/.oh-my-zsh/themes/cobalt2.zsh-theme` and edit line 52, changing the value between the closing parens and double quote:

```bash
prompt_segment black default "%(!.%{%F{yellow}%}.)<insert-prompt-here>"
```

### Colorscheme

**OSX only:**

[View iTerm colorscheme](Brogrammer.itermcolors)

The iTerm colorscheme will need to imported in the iTerm options: `Profiles > Colors > Color Presets > Import` and selected in the same dropdown after the import.

### Plugins

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Clone into `~/.oh-my-zsh/plugins/` with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

## Eslint

[View config](eslintrc)

Requires `eslint-config-airbnb` and `eslint` to be installed globally:

```zsh
npm i eslint-config-airbnb -g
npm i eslint -g
```

## Vim

[View config](vimrc)

[View colorscheme](https://github.com/j-tom/vim-old-hope)

### Plugins

- [NERDTree](https://github.com/scrooloose/nerdtree)
- [MiniBufExpl](https://github.com/fholgado/minibufexpl.vim)

