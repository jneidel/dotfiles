# dotfiles

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [Zsh (shell)](#zsh-shell)
- [Vim (editor)](#vim-editor)
- [Tmux (terminal mutiplexer)](#tmux-terminal-mutiplexer)
- [Eslint (js linter)](#eslint-js-linter)
- [Visual Studio Code (editor)](#visual-studio-code-editor)
- [Git (version control)](#git-version-control)
- [CLIs](#clis)
  * [npm](#npm)
  * [General](#general)
  * [Homebrew CLIs](#homebrew-clis)
- [Chrome Extensions](#chrome-extensions)
  * [Coding](#coding)
  * [Privacy & Adblocker](#privacy--adblocker)
  * [Misc](#misc)
- [Related](#related)

<!-- tocstop -->

</details>

## Zsh (shell)

I'm using zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

To use my zsh config fill in your home directory in the variable at line 3.

[View zsh config](zshrc) - `~/.zshrc`

[View oh-my-zsh config](oh-my-zsh.sh) - `~/.oh-my-zsh/oh-my-zsh.sh`

[View aliases](aliases.zsh) - `~/.oh-my-zsh/custom/aliases.zsh`

**Zsh theme:**

[View zsh-theme](cobalt2.zsh-theme) - `~/.oh-my-zsh/themes/cobalt2.zsh-theme`

For the theme to be rendered correctly you will need a [powerline patched font](https://github.com/robbyrussell/oh-my-zsh).
The font will need to be installed on the device and activated in the iTerm options: `Profiles > Text > Font > Change Font`.

To change the `$` default prompt in the shell, open `~/.oh-my-zsh/themes/cobalt2.zsh-theme` and edit line 52, changing the value between the closing parens and double quote:

```zsh
prompt_segment black default "%(!.%{%F{yellow}%}.)<insert-prompt-here>"
```

**Colorscheme:**

OSX only

[View iTerm colorscheme](Brogrammer.itermcolors)

The iTerm colorscheme will need to imported in the iTerm options: `Profiles > Colors > Color Presets > Import` and selected in the same dropdown after the import.

**Plugins:**

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Clone into `~/.oh-my-zsh/plugins/` with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

- [z (jump around)](https://github.com/rupa/z) (already downloaded with oh-my-zsh)

## Vim (editor)

[View vim config](vimrc) - `~/.vimrc`

[View colorscheme](https://github.com/j-tom/vim-old-hope)

**Plugins:**

- [NERDTree](https://github.com/scrooloose/nerdtree)
- [MiniBufExpl](https://github.com/fholgado/minibufexpl.vim)

## Tmux (terminal mutiplexer)

Tmux is a terminal multiplexer, that allows for multiple terminal windows to run within one, screen splitting and [much more](https://github.com/tmux/tmux/wiki).

[View tmux config](tmux.conf) - `~/.tmux.conf`

**Scripts:**

OSX only

[View scripts](.tmux) - `~/.tmux/`

- [battery](.tmux/battery) - adapted from [richoH](https://github.com/richoH/dotfiles/blob/master/bin/battery)
- [itunes](.tmux/itunes) - adapted from [erikw](https://github.com/erikw/tmux-powerline/blob/master/segments/np_itunes.script)

## Eslint (js linter)

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

## Visual Studio Code (editor)

[View vscode settings](vscode-settings.json) - `~/Library/Application\ Support/Code/User/settings.json`

[View vscode keybindings](vscode-keybindings.json) - `~/Library/Application\ Support/Code/User/keybindings.json`

**Plugins:**

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

## Git (version control)

[View global gitignore](gitignore) - `~/.gitignore`

Config commands:

```zsh
git config core.ignorecase false
```

---

## CLIs

### npm

| name | description | links |
|--|--|--|
| alder | Print current directory as ascii tree | [npm](https://www.npmjs.com/package/@aweary/alder) [github](https://github.com/aweary/alder) |
| dict-cc | Dict.cc lookup from the command line | [npm](https://www.npmjs.com/package/dict-cc-cli) [github](https://github.com/derhuerst/dict-cc-cli) |
| fkill | Interactive process killer | [npm](https://www.npmjs.com/package/fkill-cli) [github](https://github.com/sindresorhus/fkill-cli) |
| generator-jneidel | Collection of boilerplates, for installation with yeoman | [npm](https://www.npmjs.com/package/generator-jneidel) [github](https://github.com/jneidel/generator-jneidel) |
| np | Better version of 'npm publish' | [npm](https://www.npmjs.com/package/np) [github](https://github.com/sindresorhus/np) |
| npm-name | Check module name availability | [npm](https://www.npmjs.com/package/npm-name-cli) [github](https://github.com/sindresorhus/npm-name-cli) |
| markdown-toc | Create/update readme toc | [npm](https://www.npmjs.com/package/markdown-toc) [github](https://github.com/jonschlinkert/markdown-toc) |
| tslide | Terminal slide deck using markdown | [npm](https://www.npmjs.com/package/tslide) [github](https://github.com/tslide/tslide) |
| yo | Run yeoman generators to create boilerplates | [npm](https://www.npmjs.com/package/yo) [github](https://github.com/yeoman/yo) |

### General

| name | description | links |
|--|--|--|
| youtube-dl | Configurable youtube downloader | [github](https://github.com/rg3/youtube-dl) |
| asciinema | Terminal recorder | [github](https://github.com/asciinema/asciinema) [pip3](https://pypi.python.org/pypi/asciinema) |

### Homebrew CLIs

| name | description | links |
|--|--|--|
| grip | Render readme with github styles for local testing | [brew](http://brewformulas.org/grip) [github](https://github.com/joeyespo/grip) |
| mongodb | Run mongodb locally | [brew](http://brewformulas.org/Mongodb) |
| tmux | Terminal multiplexer | [brew](http://brewformulas.org/tmux) [github](https://github.com/tmux/tmux) |

## Chrome Extensions

Chrome extensions, sorted by category.

### Coding

| name | description | links |
|--|--|--|
| Chrome Markdown Preview | Elegant GFM preview on `.md` files | [chrome webstore](https://chrome.google.com/webstore/detail/chrome-markdown-preview/ghmocdlbmpcchcbkkingnkgemjacgfdf) [github](https://github.com/zce/chrome-markdown) |
| JSON Formatter | Easy to read JSON formatting | [chrome webstore](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa) [github](https://github.com/callumlocke/json-formatter) |
| OpenGenus quark | Offline algorithm search engine | [chrome webstore](https://chrome.google.com/webstore/detail/opengenus-offline-search/lfoloadpfjildomeafpdopahkdaoofbn) [github](https://github.com/OpenGenus/quark) |
| Octotree | GitHub file tree | [chrome webstore](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc) [github](https://github.com/buunguyen/octotree/) |
| npmhub | List npm dependencies in readme | [chrome webstore](https://chrome.google.com/webstore/detail/npmhub/kbbbjimdjbjclaebffknlabpogocablj) [github](https://github.com/npmhub/npmhub) |
| Refined GitHub | GitHub functional/visual upgrade | [chrome webstore](https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf) [github](https://github.com/sindresorhus/refined-github) |

### Privacy & Adblocker

| name | description | links |
|--|--|--|
| Adblock Plus | Adblocker | [chrome webstore](https://chrome.google.com/webstore/detail/adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb) |
| DuckDuckGo Privacy Essentials | DDG search, stop trackers | [chrome webstore](https://chrome.google.com/webstore/detail/duckduckgo-privacy-essent/bkdgflcldnnnapblkhphbgpggdiikppg) |
| HTTPS Everywhere | Force HTTPS connection | [chrome webstore](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp) |
| Privacy Badger | Stop trackers | [chrome webstore](https://chrome.google.com/webstore/detail/privacy-badger/pkehgijcmpdhfbdbbnkijodmdjhbjlgp) |
| uBlock Origin | Adblocker | [chrome webstore](https://chrome.google.com/webstore/detail/cjpalhdlnbpafiamejdnhcphjbkeiagm) |

### Misc

| name | description | links |
|--|--|--|
| chromelPass | KeePass integration for password insert | [chrome webstore](https://chrome.google.com/webstore/detail/chromeipass/ompiailgknfdndiefoaoiligalphfdae) [github](https://github.com/pfn/passifox/) |
| ColorZilla | Color picker | [chrome webstore](https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp) |
| Hover Zoom+ | Large overlay on image and link to image hover | [chrome webstore](https://chrome.google.com/webstore/detail/hover-zoom%20/pccckmaobkjjboncdfnnofkonhgpceea) [github](https://github.com/extesy/hoverzoom/) |
| StayFocusd | Site blocker, limit black list to given time | [chrome webstore](https://chrome.google.com/webstore/detail/stayfocusd/laankejkbhbdhmipfmgcngdelahlfoji) |
| Toby | Better bookmark manager | [chrome webstore](https://chrome.google.com/webstore/detail/toby-for-chrome/hddnkoipeenegfoeaoibdmnaalmgkpip) |

## Related

[generator-jneidel](https://github.com/jneidel/generator-jneidel) - My personal collection of boilerplates, for installation with yeoman
