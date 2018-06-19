# dotfiles

> Collection of config files and used apps

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [Configurations](#configurations)
  * [Zsh (shell)](#zsh-shell)
  * [Vim (editor)](#vim-editor)
  * [Tmux (terminal mutiplexer)](#tmux-terminal-mutiplexer)
  * [Eslint (js linter)](#eslint-js-linter)
  * [Visual Studio Code (editor)](#visual-studio-code-editor)
  * [Git (version control)](#git-version-control)
- [Apps](#apps)
  * [CLIs](#clis)
  * [Chrome Extensions](#chrome-extensions)
  * [Android](#android)
- [Related](#related)

<!-- tocstop -->

</details>

## Configurations

### Zsh (shell)

I'm using zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

To use my zsh config fill in your home directory in the variable at line 3.

View zsh config: [mac](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/.zshrc), [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/.zshrc) - `~/.zshrc`

[View oh-my-zsh config](https://raw.githubusercontent.com/jneidel/dotfiles/master/oh-my-zsh.sh) - `~/.oh-my-zsh/oh-my-zsh.sh`

View aliases: [mac](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/aliases.zsh), [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/aliases.zsh) - `~/.oh-my-zsh/custom/aliases.zsh`

**Zsh theme:**

[View zsh-theme](https://raw.githubusercontent.com/jneidel/dotfiles/master/cobalt2.zsh-theme) - `~/.oh-my-zsh/themes/cobalt2.zsh-theme`

For the theme to be rendered correctly you will need a [powerline patched font](https://github.com/robbyrussell/oh-my-zsh).
The font will need to be installed on the device and activated in the iTerm options: `Profiles > Text > Font > Change Font`.

To change the `$` default prompt in the shell, open `~/.oh-my-zsh/themes/cobalt2.zsh-theme` and edit line 52, changing the value between the closing parens and double quote:

```zsh
prompt_segment black default "%(!.%{%F{yellow}%}.)<insert-prompt-here>"
```

**Colorscheme:**

OSX only

[View iTerm colorscheme](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/brogrammer.itermcolors)

The iTerm colorscheme will need to imported in the iTerm options: `Profiles > Colors > Color Presets > Import` and selected in the same dropdown after the import.

**Plugins:**

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Clone into `~/.oh-my-zsh/plugins/` with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

- [z (jump around)](https://github.com/rupa/z) (included with oh-my-zsh)

### Vim (editor)

View vim config: [mac](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/.vimrc), [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/.vimrc) - `~/.vimrc`

[View colorscheme](https://github.com/j-tom/vim-old-hope)

**Plugins:**

- [NERDTree](https://github.com/scrooloose/nerdtree)
- [MiniBufExpl](https://github.com/fholgado/minibufexpl.vim)

### Tmux (terminal mutiplexer)

Tmux is a terminal multiplexer, that allows for multiple terminal windows to run within one, screen splitting and [much more](https://github.com/tmux/tmux/wiki).

View tmux config: [mac](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/.tmux.conf), [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/.tmux.conf) - `~/.tmux.conf`

**Scripts:**

OSX only

[View scripts](mac/.tmux) - `~/.tmux/`

- [battery](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/.tmux/battery) - adapted from [richoH](https://github.com/richoH/dotfiles/blob/master/bin/battery)
- [itunes](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/.tmux/itunes) - adapted from [erikw](https://github.com/erikw/tmux-powerline/blob/master/segments/np_itunes.script)

### Eslint (js linter)

[View eslint config](https://raw.githubusercontent.com/jneidel/dotfiles/master/.eslintrc) - `~/.eslintrc`

Once globally installed, run anywhere:

```zsh
$ eslint --fix
# or via aliases
$fix <file/dir>
$fixa
```

Requires eslint, as well as a few plugins to be installed globally:

```zsh
npm i -g eslint eslint-plugin-ava eslint-plugin-json eslint-plugin-node eslint-plugin-unicorn eslint-plugin-xo
```

For an easy start into eslint try [eslint-nibble](https://github.com/IanVS/eslint-nibble).

### Visual Studio Code (editor)

[View vscode settings](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/settings.json) - `~/Library/Application\ Support/Code/User/settings.json`

[View vscode keybindings](https://raw.githubusercontent.com/jneidel/dotfiles/master/mac/keybindings.json) - `~/Library/Application\ Support/Code/User/keybindings.json`

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

### Git (version control)

View global gitignore: [mac](mac/.gitignore), [manjaro](manjaro/.gitignore) - `~/.gitignore`

Config commands:

```zsh
git config core.ignorecase false
```

---

## Apps

### CLIs

**npm:**

| name | description | links |
|--|--|--|
| alder | Print current directory as ascii tree | [npm](https://www.npmjs.com/package/@aweary/alder) [github](https://github.com/aweary/alder) |
| chrome-cli | Open given file in chrome | [npm](https://www.npmjs.com/package/chrome-cli) [github](https://github.com/diogocampos/chrome-cli) |
| dict-cc | Dict.cc lookup from the command line | [npm](https://www.npmjs.com/package/dict-cc-cli) [github](https://github.com/derhuerst/dict-cc-cli) |
| fkill | Interactive process killer | [npm](https://www.npmjs.com/package/fkill-cli) [github](https://github.com/sindresorhus/fkill-cli) |
| generator-jneidel | Collection of boilerplates, for installation with yeoman | [npm](https://www.npmjs.com/package/generator-jneidel) [github](https://github.com/jneidel/generator-jneidel) |
| np | Better version of 'npm publish' | [npm](https://www.npmjs.com/package/np) [github](https://github.com/sindresorhus/np) |
| npm-name | Check module name availability | [npm](https://www.npmjs.com/package/npm-name-cli) [github](https://github.com/sindresorhus/npm-name-cli) |
| markdown-toc | Create/update readme toc | [npm](https://www.npmjs.com/package/markdown-toc) [github](https://github.com/jonschlinkert/markdown-toc) |
| tslide | Terminal slide deck using markdown | [npm](https://www.npmjs.com/package/tslide) [github](https://github.com/tslide/tslide) |
| yo | Run yeoman generators to create boilerplates | [npm](https://www.npmjs.com/package/yo) [github](https://github.com/yeoman/yo) |

**General:**

| name | description | links |
|--|--|--|
| youtube-dl | Configurable youtube downloader | [github](https://github.com/rg3/youtube-dl) |
| asciinema | Terminal recorder | [github](https://github.com/asciinema/asciinema) [pip3](https://pypi.python.org/pypi/asciinema) |

**Homebrew:**

| name | description | links |
|--|--|--|
| grip | Render readme with github styles for local testing | [brew](http://brewformulas.org/grip) [github](https://github.com/joeyespo/grip) |
| mongodb | Run mongodb locally | [brew](http://brewformulas.org/Mongodb) |
| tmux | Terminal multiplexer | [brew](http://brewformulas.org/tmux) [github](https://github.com/tmux/tmux) |

**Pacman (Manjaro Linux):**

| name | description | links |
|--|--|--|
|  |  |  |

### Chrome Extensions

Chrome extensions, sorted by category.

**Coding:**

| name | description | links |
|--|--|--|
| Chrome Markdown Preview | Elegant GFM preview on `.md` files | [chrome-webstore](https://chrome.google.com/webstore/detail/chrome-markdown-preview/ghmocdlbmpcchcbkkingnkgemjacgfdf) [github](https://github.com/zce/chrome-markdown) |
| JSON Formatter | Easy to read JSON formatting | [chrome-webstore](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa) [github](https://github.com/callumlocke/json-formatter) |
| OpenGenus quark | Offline algorithm search engine | [chrome-webstore](https://chrome.google.com/webstore/detail/opengenus-offline-search/lfoloadpfjildomeafpdopahkdaoofbn) [github](https://github.com/OpenGenus/quark) |
| npmhub | List npm dependencies in readme | [chrome-webstore](https://chrome.google.com/webstore/detail/npmhub/kbbbjimdjbjclaebffknlabpogocablj) [github](https://github.com/npmhub/npmhub) |
| Refined GitHub | GitHub functional/visual upgrade | [chrome-webstore](https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf) [github](https://github.com/sindresorhus/refined-github) |

<details>
<summary><strong>More GitHub related plugins</strong></summary>

A comprehensive list of GitHub chrome extensions can be found [here](https://github.com/stefanbuck/awesome-browser-extensions-for-github).

| name | description | links |
|--|--|--|
| Octotree | GitHub file tree | [chrome-webstore](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc) [github](https://github.com/buunguyen/octotree/) |
| Vscode-icons | Icons indicating file type | [chrome-webstore](https://chrome.google.com/webstore/detail/github-vscode-icons/hoccpcefjcgnabbmojbfoflggkecmpgd) [github](https://github.com/dderevjanik/github-vscode-icons) |
| Lovely Forks | Shows notable forks | [chrome-webstore](https://chrome.google.com/webstore/detail/lovely-forks/ialbpcipalajnakfondkflpkagbkdoib) [github](https://github.com/musically-ut/lovely-forks) |
| npm-stats | Display npm download stats in repo | [chrome-webstore](https://chrome.google.com/webstore/detail/github-npm-stats/oomfflokggoffaiagenekchfnpighcef) [github](https://github.com/katranci/github-npm-stats) |
| show-email | Display email on profile, even if not provided | [chrome-webstore](https://chrome.google.com/webstore/detail/github-show-email/pndebicblkfcinlcedagfhjfkkkecibn) [github](https://github.com/prabhakar267/github-email-extractor) |
| omnibar | Shortcut navigation for github | [chrome-webstore](https://chrome.google.com/webstore/detail/github-omnibar/njccjmmakcbdpnlbodllfgiloenfpocb/related?utm_source=chrome-ntp-icon) [github](https://github.com/jcouyang/gh-omnibar) |
| issue-link-status | Colorize issue links depending on status | [chrome-webstore](https://chrome.google.com/webstore/detail/github-issue-link-status/nbiddhncecgemgccalnoanpnenalmkic) [github](https://github.com/bfred-it/github-issue-link-status/) |
| build-tabs | Build tab for github | [chrome-webstore](https://chrome.google.com/webstore/detail/builds-tab-for-github/jnmdkbflmkjehkkdbjdfpmhgdafpcdkh) [github](https://github.com/duxet/builds-tab) |
| github-autocomplete | Github search autocomplete | [chrome-webstore](https://chrome.google.com/webstore/detail/awesome-autocomplete-for/djkfdjpoelphhdclfjhnffmnlnoknfnd) [github](https://github.com/algolia/github-awesome-autocomplete) |
| github-plus | Display repo size, download links | [chrome-webstore](https://chrome.google.com/webstore/detail/github-plus/anlikcnbgdeidpacdbdljnabclhahhmd) [github](https://github.com/softvar/github-plus) |

<!-- |  |  | [chrome-webstore]() [github]() | -->

</details><br/>

**Privacy & Adblocker:**

| name | description | links |
|--|--|--|
| Adblock Plus | Adblocker | [chrome-webstore](https://chrome.google.com/webstore/detail/adblock-plus/cfhdojbkjhnklbpkdaibdccddilifddb) |
| DuckDuckGo Privacy Essentials | DDG search, stop trackers | [chrome-webstore](https://chrome.google.com/webstore/detail/duckduckgo-privacy-essent/bkdgflcldnnnapblkhphbgpggdiikppg) |
| HTTPS Everywhere | Force HTTPS connection | [chrome-webstore](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp) |
| Privacy Badger | Stop trackers | [chrome-webstore](https://chrome.google.com/webstore/detail/privacy-badger/pkehgijcmpdhfbdbbnkijodmdjhbjlgp) |
| uBlock Origin | Adblocker | [chrome-webstore](https://chrome.google.com/webstore/detail/cjpalhdlnbpafiamejdnhcphjbkeiagm) |

**Misc:**

| name | description | links |
|--|--|--|
| chromelPass | KeePass integration for password insert | [chrome-webstore](https://chrome.google.com/webstore/detail/chromeipass/ompiailgknfdndiefoaoiligalphfdae) [github](https://github.com/pfn/passifox/) |
| ColorZilla | Color picker | [chrome-webstore](https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp) |
| Hover Zoom+ | Large overlay on image and link to image hover | [chrome-webstore](https://chrome.google.com/webstore/detail/hover-zoom%20/pccckmaobkjjboncdfnnofkonhgpceea) [github](https://github.com/extesy/hoverzoom/) |
| StayFocusd | Site blocker, limit black list to given time | [chrome-webstore](https://chrome.google.com/webstore/detail/stayfocusd/laankejkbhbdhmipfmgcngdelahlfoji) |
| Toby | Better bookmark manager | [chrome-webstore](https://chrome.google.com/webstore/detail/toby-for-chrome/hddnkoipeenegfoeaoibdmnaalmgkpip) |

### Android

F-Droid is a software repository hosting free and mostly open source apps. If available always try to use F-Droid over the google-playstore. Read more on [F-Droid](https://f-droid.org/).

| name | description | links |
|--|--|--|
| Anki | Flashcards | [f-droid](https://f-droid.org/en/packages/com.ichi2.anki/) [google-play](https://play.google.com/store/apps/details?id=com.ichi2.anki) [github](https://github.com/ankidroid/Anki-Android) |
| Audipo | Audioplayer optimized for podcasts (speed, skipping) | [google-play](https://play.google.com/store/apps/details?id=jp.ne.sakura.ccice.audipo) |
| Bluelight Filter | Filters the bluelight, easier on the eyes, set filter based on time | [google-play](https://play.google.com/store/apps/details?id=jp.ne.hardyinfinity.bluelightfilter.free) |
| CamScanner | Document scanner | [google-play](https://play.google.com/store/apps/details?id=com.intsig.camscanner) |
| dict.cc | Offline dictionary | [google-play](https://play.google.com/store/apps/details?id=cc.dict.dictcc) |
| ES File Explorer | File explorer | [google-play](https://play.google.com/store/apps/details?id=com.estrongs.android.pop.pro) |
| FBReader | Ebook reader | [f-droid](https://f-droid.org/packages/org.geometerplus.zlibrary.ui.android/) [google-play](https://play.google.com/store/apps/details?id=org.geometerplus.zlibrary.ui.android&referrer=utm_source%3Dfbreader.org%26utm_medium%3Dbadge%26utm_content%3Dandroid-page-bottom%26utm_campaign%3Dbadge) [github](https://github.com/geometer/FBReaderJ) |
| HiPER Calc | Superior calculator | [google-play](https://play.google.com/store/apps/details?id=cz.hipercalc.pro) |
| Markor | Markdown editor | [f-droid](https://f-droid.org/en/packages/net.gsantner.markor/) [google-play](https://play.google.com/store/apps/details?id=net.gsantner.markor) [github](https://github.com/gsantner/markor) |
| My Expenses | Expense/income tracker, with exports | [f-droid](https://f-droid.org/repository/browse/?fdid=org.totschnig.myexpenses) [google-play](https://play.google.com/store/apps/details?id=org.totschnig.myexpenses) [github](https://github.com/mtotschnig/MyExpenses) |
| MX Player | Video player | [google-play](https://play.google.com/store/apps/details?id=com.mxtech.videoplayer.pro) |
| Signal | End to end encrypted chat | [google-play](https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms) [github](https://github.com/signalapp/Signal-Android) |
| Time Meter | Smooth time tracker, with exports  | [google-play](https://play.google.com/store/apps/details?id=com.rk.timemeter) |
| Todoist | Todo list for all platforms | [google-play](https://play.google.com/store/apps/details?id=com.todoist) |
| Relaxio | White-noise generator | [google-play](https://play.google.com/store/apps/details?id=net.relaxio.relaxio) |

## Related

[generator-jneidel](https://github.com/jneidel/generator-jneidel) - My personal collection of boilerplates, for installation with yeoman
