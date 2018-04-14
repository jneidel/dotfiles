# dotfiles

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [Zsh](#zsh)
  * [Zsh theme](#zsh-theme)
  * [Colorscheme](#colorscheme)
  * [Plugins](#plugins)
- [Vim](#vim)
  * [Plugins](#plugins-1)
- [Tmux](#tmux)
  * [Scripts](#scripts)
- [Eslint](#eslint)
- [Visual Studio Code](#visual-studio-code)
  * [Plugins](#plugins-2)
- [Git](#git)
- [NPM CLIs](#npm-clis)
- [Homebrew CLIs](#homebrew-clis)
- [Chrome Extensions](#chrome-extensions)
  * [Coding](#coding)
  * [Privacy & Adblocker](#privacy--adblocker)
  * [Misc](#misc)

<!-- tocstop -->

</details>

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

## Vim

[View vim config](vimrc) - `~/.vimrc`

[View colorscheme](https://github.com/j-tom/vim-old-hope)

### Plugins

- [NERDTree](https://github.com/scrooloose/nerdtree)
- [MiniBufExpl](https://github.com/fholgado/minibufexpl.vim)

## Tmux

Tmux is a terminal multiplexer, that allows for multiple terminal windows to run within one, screen splitting and [much more](https://github.com/tmux/tmux/wiki).

[View tmux config](tmux.conf) - `~/.tmux.conf`

### Scripts

**OSX only:**

[View scripts](.tmux) - `~/.tmux/`

- [battery](.tmux/battery) - adapted from [richoH](https://github.com/richoH/dotfiles/blob/master/bin/battery)
- [itunes](.tmux/itunes) - adapted from [erikw](https://github.com/erikw/tmux-powerline/blob/master/segments/np_itunes.script)

## Eslint

[View eslint config](eslintrc) - `~/.eslintrc`

Once globally installed, run anywhere:

```zsh
eslint --fix
```

Requires eslint, as well as a few plugins to be installed globally:

```zsh
npm i -g eslint eslint-plugin-ava eslint-plugin-json eslint-plugin-node eslint-plugin-unicorn eslint-plugin-xo
```

For an easy start into eslint try [eslint-nibble](https://github.com/IanVS/eslint-nibble).

## Visual Studio Code

[View vscode settings](vscode-settings.json) - `~/Library/Application\ Support/Code/User/settings.json`

[View vscode keybindings](vscode-keybindings.json) - `~/Library/Application\ Support/Code/User/keybindings.json`

### Plugins

- [An Old Hope Theme](https://marketplace.visualstudio.com/items?itemName=dustinsanders.an-old-hope-theme-vscode)
- [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag) - Create HTML closing bracket
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag) - Rename corresponding tag automatically
- [AutoFileName](https://marketplace.visualstudio.com/items?itemName=JerryHong.autofilename)
- [Babel ES6/ES7](https://marketplace.visualstudio.com/items?itemName=dzannotti.vscode-babel-coloring) - Autocomplete for latest JS features
- [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)
- [EditorConfig for VSCode](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) - Use .editorconfig file if available
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) - Run ESLint on save
- [npm Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense)
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [Version Lens](https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens) - Update dependencies individually from within package.json
- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) - Vim mode for VSCode
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons) - Nice language specific icons in the explorer

## Git

[View global gitignore](gitignore) - `~/.gitignore`

Config commands:

```zsh
git config core.ignorecase false
```

## NPM CLIs

| Name | Description |
|--|--|
| [@aweary/alder](https://github.com/aweary/alder) | Print current directory as ascii tree |
| [dict-cc-cli](https://github.com/derhuerst/dict-cc-cli) | Dict.cc lookup from the command line |
| [fkill-cli](https://www.npmjs.com/package/fkill-cli) | Interactive process killer |
| [generator-jneidel](https://github.com/jneidel/generator-jneidel) | Collection of boilerplates, for installation with yeoman |
| [np](https://github.com/sindresorhus/np) | Better version of 'npm publish' |
| [npm-name-cli](https://www.npmjs.com/package/npm-name-cli) | Check module name availability |
| [markdown-toc](https://www.npmjs.com/package/markdown-toc) | Create/update readme toc |
| [tslide](https://github.com/tslide/tslide) | Terminal slide deck using markdown |
| [yo](https://github.com/yeoman/yo) | Run yeoman generators to create boilerplates |

## CLIs

| Name | Description |
|--|--|
| [youtube-dl](https://github.com/rg3/youtube-dl) | Configurable youtube downloader |
| [asciinema](https://github.com/asciinema/asciinema) | Terminal recorder |

## Homebrew CLIs

| Name | Description |
|--|--|
| [grip](http://brewformulas.org/grip) | Render readme with github styles for local testing |
| [mongodb](http://brewformulas.org/Mongodb) | Run mongodb locally |
| [tmux](http://brewformulas.org/tmux) | Terminal multiplexer |

## Chrome Extensions

Chrome extensions, sorted by category.

### Coding

| Name | Description |
|--|--|
| [Chrome Markdown Preview](https://chrome.google.com/webstore/detail/chrome-markdown-preview/ghmocdlbmpcchcbkkingnkgemjacgfdf) | Elegant GFM preview on `.md` files |
| [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa) | Easy to read JSON formatting |
| [OpenGenus](https://chrome.google.com/webstore/detail/opengenus-offline-search/lfoloadpfjildomeafpdopahkdaoofbn) | Offline algorithm search engine |
| [Octotree](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc) | GitHub file tree |
| [Npmhub](https://chrome.google.com/webstore/detail/npmhub/kbbbjimdjbjclaebffknlabpogocablj) | List npm dependencies in readme |
| [Refined GitHub](https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf) | GitHub functional/visual upgrade |

### Privacy & Adblocker

| Name | Description |
|--|--|
| [Adblock Plus](https://chrome.google.com/webstore/detail/adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb) | Adblocker |
| [DuckDuckGo Privacy Essentials](https://chrome.google.com/webstore/detail/duckduckgo-privacy-essent/bkdgflcldnnnapblkhphbgpggdiikppg) | DDG search, stop trackers |
| [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp) | Force HTTPS |
| [Privacy Badger](https://chrome.google.com/webstore/detail/privacy-badger/pkehgijcmpdhfbdbbnkijodmdjhbjlgp) | Stop trackers |
| [uBlock Origin](https://chrome.google.com/webstore/detail/cjpalhdlnbpafiamejdnhcphjbkeiagm) | Adblocker |

### Misc

| Name | Description |
|--|--|
| [chromelPass](https://chrome.google.com/webstore/detail/chromeipass/ompiailgknfdndiefoaoiligalphfdae) | KeePass integration for password insert |
| [ColorZilla](https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp) | Color picker |
| [Hover Zoom+](https://chrome.google.com/webstore/detail/hover-zoom%20/pccckmaobkjjboncdfnnofkonhgpceea) | Large overlay on image and link to image hover |
| [StayFocusd](https://chrome.google.com/webstore/detail/stayfocusd/laankejkbhbdhmipfmgcngdelahlfoji) | Site blocker, limit black list to given time |
| [Toby](https://chrome.google.com/webstore/detail/toby-for-chrome/hddnkoipeenegfoeaoibdmnaalmgkpip) | Better bookmark manager |

