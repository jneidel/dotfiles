# dotfiles

## Zsh

[View config](zshrc)

[View zsh-theme](cobalt2.zsh-theme)

[View iterm colorscheme](Brogrammer.itermcolors)

To install a zsh-theme [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is required.
After installing oh-my-zsh put the the zsh-theme into `.oh-my-zsh/themes/`.

For it to be rendered correctly one will need a [powerline patched font](https://github.com/robbyrussell/oh-my-zsh).
The font will need to be installed on the device and activated in the iTerm options: `Profiles > Text > Font > Change Font`.

The iTerm colorscheme will need to imported in the iTerm options: `Profiles > Colors > Color Presets > Import` and selected in the same dropdown after the import.

### Plugins

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

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

