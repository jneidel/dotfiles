# dotfiles

> Collection of config files, install scripts, list of used apps

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [Configurations](#configurations)
  * [Zsh (shell)](#zsh-shell)
  * [Terminal](#terminal)
  * [Tmux (terminal mutiplexer)](#tmux-terminal-mutiplexer)
  * [Vim (TUI editor)](#vim-tui-editor)
  * [Eslint (js linter)](#eslint-js-linter)
  * [Git (version control)](#git-version-control)
- [Apps](#apps)
  * [CLIs](#clis)
  * [Browser Extensions](#browser-extensions)
  * [Android](#android)
  * [Music setup](#music-setup)
- [OSX](#osx)
- [Related](#related)

<!-- tocstop -->

</details>

## Configurations

**Warning:** links to config files are outdated.

### Zsh (shell)

I'm using zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

View zsh config: [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/.zshrc) (change the `User specific` section of this config) - `~/.zshrc`

[View oh-my-zsh config](https://raw.githubusercontent.com/jneidel/dotfiles/master/oh-my-zsh.sh) (I removed everything uneccessary to me, as it slowed me down on every new shell instance) - `~/.oh-my-zsh/oh-my-zsh.sh`

View aliases:
- [manjaro](https://github.com/jneidel/dotfiles/blob/master/manjaro/.zsh/init.zsh) (this file links to all other alias files, which can be found in the same dir) - `~/.zsh/init.zsh`

**Zsh theme:**

[View zsh-theme](https://raw.githubusercontent.com/jneidel/dotfiles/master/cobalt2.zsh-theme) - `~/.oh-my-zsh/themes/cobalt2.zsh-theme`

For the theme to be rendered correctly you will need a [powerline patched font](https://github.com/powerline/fonts) (I use [Roboto Mono](https://github.com/powerline/fonts/blob/master/RobotoMono/Roboto%20Mono%20for%20Powerline.ttf)).

The font will need to be installed on the device. On linux just place the ttf file in `~/.fonts`.

To change the `$` default prompt in the shell, open `~/.oh-my-zsh/themes/cobalt2.zsh-theme` and edit line 52, changing the value between the closing parens and double quote:

```zsh
prompt_segment black default "%(!.%{%F{yellow}%}.)<insert-prompt-here>"
```

**Plugins:**

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Clone into `~/.oh-my-zsh/plugins/` with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

- [z (jump around)](https://github.com/rupa/z) (included with oh-my-zsh)

### Terminal

[View](manjaro/readme.md#kitty-terminal) Kitty notes

### Tmux (terminal mutiplexer)

Tmux is a terminal multiplexer, that allows for multiple terminal windows to run within one, screen splitting and [much more](https://github.com/tmux/tmux/wiki).

View tmux config: [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/.tmux.conf) - `~/.tmux.conf`

**Scripts:**

View scripts: [manjaro](manjaro/.tmux) - `~/.tmux/`

- [cmus](https://github.com/jneidel/dotfiles/blob/master/manjaro/.tmux/cmus-current-track) - get current cmus track
- [mullvad](https://github.com/jneidel/dotfiles/blob/master/manjaro/.tmux/mullvad-running) - check if mullvad is running

### Vim (TUI editor)

View vim config: [manjaro](https://raw.githubusercontent.com/jneidel/dotfiles/master/manjaro/.vimrc) - `~/.vimrc`

[View plugins](docs/vim.md)

[View colorscheme](https://github.com/j-tom/vim-old-hope)

### Eslint (js linter)

[View eslint config](https://raw.githubusercontent.com/jneidel/dotfiles/master/.eslintrc) - `~/.eslintrc`
[View eslint typescript config](https://raw.githubusercontent.com/jneidel/dotfiles/master/.eslintrc-ts) - `~/.eslintrc-ts`

Once globally installed, run anywhere:

```zsh
# for js
eslint --fix .

# for ts
eslint -c ~/.eslintrc-ts --fix .
```

See [eslint aliases](https://github.com/jneidel/dotfiles/blob/master/manjaro/.zsh/eslint.zsh) for shortcuts.

Requires eslint, as well as a few plugins to be installed globally:

```zsh
# for js
npm i -g eslint eslint-plugin-node eslint-plugin-unicorn eslint-plugin-json eslint-plugin-xo eslint-config-xo

# for js & ts
npm i -g eslint eslint-plugin-node eslint-plugin-unicorn eslint-plugin-json eslint-plugin-xo eslint-config-xo eslint-config-xo-typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin
```

For an easy start into eslint try [eslint-nibble](https://github.com/IanVS/eslint-nibble).

### Git (version control)

View global gitignore: [manjaro](manjaro/.gitignore) - `~/.gitignore`

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
| fkill | Interactive process killer | [npm](https://www.npmjs.com/package/fkill-cli) [github](https://github.com/sindresorhus/fkill-cli) |
| dict-cc | Dict.cc lookup from the command line | [npm](https://www.npmjs.com/package/dict-cc-cli) [github](https://github.com/derhuerst/dict-cc-cli) |
| tslide | Terminal slide deck using markdown | [npm](https://www.npmjs.com/package/tslide) [github](https://github.com/tslide/tslide) |
| alder | Print current directory as ascii tree | [npm](https://www.npmjs.com/package/@aweary/alder) [github](https://github.com/aweary/alder) |

**npm development:**

| name | description | links |
|--|--|--|
| markdown-toc | Generate markdown toc | [npm](https://www.npmjs.com/package/markdown-toc) [github](https://github.com/jonschlinkert/markdown-toc) |
| np | Better version of 'npm publish' | [npm](https://www.npmjs.com/package/np) [github](https://github.com/sindresorhus/np) |
| npm-name | Check module name availability | [npm](https://www.npmjs.com/package/npm-name-cli) [github](https://github.com/sindresorhus/npm-name-cli) |
| yo | Run yeoman generators to create boilerplates | [npm](https://www.npmjs.com/package/yo) [github](https://github.com/yeoman/yo) |
| generator-jneidel | Collection of boilerplates, for installation with yeoman | [npm](https://www.npmjs.com/package/generator-jneidel) [github](https://github.com/jneidel/generator-jneidel) |

**General:**

| name | description | links |
|--|--|--|
| tmux | Terminal multiplexer | [pacman](https://aur.archlinux.org/packages/tmux-git/) [homebrew](http://brewformulas.org/tmux) [github](https://github.com/tmux/tmux) |
| youtube-dl | Configurable youtube downloader | [pacman](https://aur.archlinux.org/packages/youtube-dl-git/) [github](https://github.com/rg3/youtube-dl) |

**General development:**

| name | description | links |
|--|--|--|
| grip | Render readme with github styles for local testing | [pacman](https://aur.archlinux.org/packages/python-grip/) [homebrew](http://brewformulas.org/grip) [github](https://github.com/joeyespo/grip) |
| jq | JSON processor | [pacman](https://aur.archlinux.org/packages/jq-git/) [github](https://github.com/stedolan/jq) |

<!--**Pacman (Manjaro Linux):**

| asciinema | Terminal recorder | [github](https://github.com/asciinema/asciinema) [pip3](https://pypi.python.org/pypi/asciinema) |

| name | description | links |
|--|--|--|
|  |  |  |
-->

### Browser Extensions

Browser extensions, sorted by category.

**Essentials:**

| name | description | links |
|--|--|--|
| uBlock Origin | Best free (as in freedom) adblocker | [firefox](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) [chrome](https://chrome.google.com/webstore/detail/cjpalhdlnbpafiamejdnhcphjbkeiagm) |
| Vimium | Navigate browser with vim shortcuts | [firefox](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/) [chrome](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb) [github](https://github.com/philc/vimium) |
| HTTPS Everywhere | Force encrypted connections (HTTPS) | [firefox](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/) [chrome](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp) |

**Privacy:**

Firefox (nightly) is my main browser. I have it setup to delete cookies and history on exit. You can find these options under "Privacy & Security".

| name | description | links |
|--|--|--|
| Privacy Badger | Stop suspicious trackers | [firefox](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/) [chrome](https://chrome.google.com/webstore/detail/privacy-badger/pkehgijcmpdhfbdbbnkijodmdjhbjlgp) |
| NoScript | Block domains from executing javascript | [firefox](https://addons.mozilla.org/en-US/firefox/addon/noscript/) |
| Chameleon | Easily spoof user-agents & more | [firefox](https://addons.mozilla.org/en-US/firefox/addon/chameleon-ext/) [github](https://github.com/sereneblue/chameleon) |
| Decentraleyes | Stop tracking through CDNs | [firefox](https://addons.mozilla.org/en-US/firefox/addon/decentraleyes) |
| Disable WebRTC | Stop IP leakage while using a VPN | [firefox](https://addons.mozilla.org/en-US/firefox/addon/happy-bonobo-disable-webrtc/) |

For an more infos on why these plugins are important view [privacytools.io](https://www.privacytools.io/#addons).

[See my exported settings](.firefox-extension-data/readme.md) for some of the addons.

**Coding:**

Chromium is my browser for web-development.

| name | description | links |
|--|--|--|
| Chrome Markdown Preview | Elegant GFM preview on `.md` files | [chrome](https://chrome.google.com/webstore/detail/chrome-markdown-preview/ghmocdlbmpcchcbkkingnkgemjacgfdf) [github](https://github.com/zce/chrome-markdown) |
| JSON Formatter | Easy to read JSON formatting | [chrome](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa) [github](https://github.com/callumlocke/json-formatter) |
| Modify Header Value | Set HTTP headers | [firefox](https://addons.mozilla.org/en-US/firefox/addon/modify-header-value) [chrome](https://chrome.google.com/webstore/detail/modify-header-value-http/cbdibdfhahmknbkkojljfncpnhmacdek) [homepage](https://mybrowseraddon.com/modify-header-value.html) |
| OpenGenus quark | Offline algorithm search engine | [chrome](https://chrome.google.com/webstore/detail/opengenus-offline-search/lfoloadpfjildomeafpdopahkdaoofbn) [github](https://github.com/OpenGenus/quark) |
| npmhub | List npm dependencies in readme | [chrome](https://chrome.google.com/webstore/detail/npmhub/kbbbjimdjbjclaebffknlabpogocablj) [github](https://github.com/npmhub/npmhub) |
| Refined GitHub | GitHub functional/visual upgrade | [chrome](https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf) [github](https://github.com/sindresorhus/refined-github) |

<details>
<summary><strong>More GitHub related plugins</strong></summary>

A comprehensive list of GitHub chrome extensions can be found [here](https://github.com/stefanbuck/awesome-browser-extensions-for-github).

| name | description | links |
|--|--|--|
| Octotree | GitHub file tree | [chrome](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc) [github](https://github.com/buunguyen/octotree/) |
| Vscode-icons | Icons indicating file type | [chrome](https://chrome.google.com/webstore/detail/github-vscode-icons/hoccpcefjcgnabbmojbfoflggkecmpgd) [github](https://github.com/dderevjanik/github-vscode-icons) |
| Lovely Forks | Shows notable forks | [chrome](https://chrome.google.com/webstore/detail/lovely-forks/ialbpcipalajnakfondkflpkagbkdoib) [github](https://github.com/musically-ut/lovely-forks) |
| npm-stats | Display npm download stats in repo | [chrome](https://chrome.google.com/webstore/detail/github-npm-stats/oomfflokggoffaiagenekchfnpighcef) [github](https://github.com/katranci/github-npm-stats) |
| show-email | Display email on profile, even if not provided | [chrome](https://chrome.google.com/webstore/detail/github-show-email/pndebicblkfcinlcedagfhjfkkkecibn) [github](https://github.com/prabhakar267/github-email-extractor) |
| omnibar | Shortcut navigation for github | [chrome](https://chrome.google.com/webstore/detail/github-omnibar/njccjmmakcbdpnlbodllfgiloenfpocb/related?utm_source=chrome-ntp-icon) [github](https://github.com/jcouyang/gh-omnibar) |
| issue-link-status | Colorize issue links depending on status | [chrome](https://chrome.google.com/webstore/detail/github-issue-link-status/nbiddhncecgemgccalnoanpnenalmkic) [github](https://github.com/bfred-it/github-issue-link-status/) |
| build-tabs | Build tab for github | [chrome](https://chrome.google.com/webstore/detail/builds-tab-for-github/jnmdkbflmkjehkkdbjdfpmhgdafpcdkh) [github](https://github.com/duxet/builds-tab) |
| github-autocomplete | Github search autocomplete | [chrome](https://chrome.google.com/webstore/detail/awesome-autocomplete-for/djkfdjpoelphhdclfjhnffmnlnoknfnd) [github](https://github.com/algolia/github-awesome-autocomplete) |
| github-plus | Display repo size, download links | [chrome](https://chrome.google.com/webstore/detail/github-plus/anlikcnbgdeidpacdbdljnabclhahhmd) [github](https://github.com/softvar/github-plus) |

<!-- |  |  | [chrome]() [github]() | -->

</details><br/>

**Misc:**

| name | description | links |
|--|--|--|
| KeePassXC-Browser | KeePass integration for password insert | [firefox](https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/) [chrome](https://chrome.google.com/webstore/detail/keepassxc-browser/oboonakemofpalcgghocfoadofidjkkk) [github](https://github.com/keepassxreboot/keepassxc-browser) |
| Easy to RSS | Get the rss feeds of the current site | [firefox](https://addons.mozilla.org/en-GB/firefox/addon/easy-to-rss/) [github](https://github.com/idealclover/Easy-to-RSS) |
| SoundCloudOG | Filter reposts out of your soundcloud stream | [chrome](https://chrome.google.com/webstore/detail/soundcloudog/enegaliobdmmnlcgdfljpebckdfbgcai) |
| Dict.cc Translation | Quick translations | [firefox](https://addons.mozilla.org/firefox/addon/dictcc-translation/) [github](https://github.com/Lusito/dict.cc-translation) |
| Universal Bypass | Bypass annoying link shorteners | [firefox](https://addons.mozilla.org/en-US/firefox/addon/universal-bypass) [github](https://github.com/timmyrs/Universal-Bypass) |
| Dict.cc Translation | Translate a word on the screen without opening a new tab | [firefox](https://addons.mozilla.org/en-US/firefox/addon/dictcc-translation) [github](https://github.com/Lusito/dict.cc-translation)
| Dark Reader | Dark mode for websites | [firefox](https://addons.mozilla.org/en-US/firefox/addon/darkreader) [chrome](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh) [github](https://github.com/darkreader/darkreader) |
| IMDb Ratings on Netflix | Show ratings on overview pages | [firefox](https://addons.mozilla.org/en-US/firefox/addon/imdb-ratings-on-netflix) [chrome](https://chrome.google.com/webstore/detail/imdb-ratings-on-netflix/ohonjgnjobblbhfeamidafpnbkppbljh) [github](https://github.com/pawanmaurya/imdb-ratings-on-netflix) |
| StayFocusd | Site blocker, limit black list to given time | [chrome](https://chrome.google.com/webstore/detail/stayfocusd/laankejkbhbdhmipfmgcngdelahlfoji) |
| Toby | Better bookmark manager | [chrome](https://chrome.google.com/webstore/detail/toby-for-chrome/hddnkoipeenegfoeaoibdmnaalmgkpip) |
| Hover Zoom+ | Large overlay on image and link to image hover | [chrome](https://chrome.google.com/webstore/detail/hover-zoom%20/pccckmaobkjjboncdfnnofkonhgpceea) [github](https://github.com/extesy/hoverzoom/) |
| Theater Mode for YouTube | Activate theater mode for all yt videos | [firefox](https://addons.mozilla.org/en-US/firefox/addon/theater-mode-for-youtube/) |

**Theme:**

I use **Arc Dark** as I based my terminal colorscheme on it.
[firefox](https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme-we/)
[chrome](https://chrome.google.com/webstore/detail/arc-dark/adicoenigffoolephelklheejpcpoolk)

### Android

F-Droid is a software repository hosting free and (mostly) open source apps. If available always try to use F-Droid over the google play store. Read more on [F-Droid](https://f-droid.org/). Most fdroid apps are also on gplay, even if I did not include them here.

Ordered by importance.

| name | description | links |
|--|--|--|
| Signal | Privacy friendly messaging, end to end encrypted chat | [gplay](https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms) [github](https://github.com/signalapp/Signal-Android) |
| Vinyl | Full featured music player | [f-droid](https://f-droid.org/packages/com.poupa.vinylmusicplayer/) [gplay](https://play.google.com/store/apps/details?id=com.poupa.vinylmusicplayer) [github](https://github.com/AdrienPoupa/VinylMusicPlayer) |
| Bluelight Filter | Filters the bluelight, easier on the eyes, set filter based on time | [gplay](https://play.google.com/store/apps/details?id=jp.ne.hardyinfinity.bluelightfilter.free) |
| Öffi | Public transport planning | [fdroid](https://f-droid.org/en/packages/de.schildbach.oeffi/) |
| OsmAnd | Navigation | [fdroid](https://f-droid.org/packages/net.osmand.plus/) [gplay](https://play.google.com/store/apps/details?id=net.osmand) |
| dict.cc | Offline dictionary | [gplay](https://play.google.com/store/apps/details?id=cc.dict.dictcc) |
| FBReader | Ebook reader | [f-droid](https://f-droid.org/packages/org.geometerplus.zlibrary.ui.android/) [gplay](https://play.google.com/store/apps/details?id=org.geometerplus.zlibrary.ui.android&referrer=utm_source%3Dfbreader.org%26utm_medium%3Dbadge%26utm_content%3Dandroid-page-bottom%26utm_campaign%3Dbadge) [github](https://github.com/geometer/FBReaderJ) |
| DuckDuckGo | Browser | [fdroid](https://f-droid.org/en/packages/com.duckduckgo.mobile.android/) |
| Markor | Markdown editor, notes app | [f-droid](https://f-droid.org/en/packages/net.gsantner.markor/) [gplay](https://play.google.com/store/apps/details?id=net.gsantner.markor) [github](https://github.com/gsantner/markor) |
| ES File Explorer | File explorer | [gplay](https://play.google.com/store/apps/details?id=com.estrongs.android.pop.pro) |
| OI Shopping List | Shopping list | [fdroid](https://f-droid.org/packages/org.openintents.shopping) |
| MuPDF | PDF viewer | [fdroid](https://f-droid.org/en/packages/com.artifex.mupdf.viewer.app) |
| MX Player | Video player (better than vlc) | [gplay](https://play.google.com/store/apps/details?id=com.mxtech.videoplayer.pro) |
| Audipo | Audio player optimized for podcasts (speed, skipping) | [gplay](https://play.google.com/store/apps/details?id=jp.ne.sakura.ccice.audipo) |
| JuiceSSH | Mobile mosh (ssh) client | [fdroid](https://play.google.com/store/apps/details?id=com.sonelli.juicessh) |
| Vespucci | OSM Editor | [fdroid](https://f-droid.org/en/packages/de.blau.android) |
| CamScanner | Document scanner | [gplay](https://play.google.com/store/apps/details?id=com.intsig.camscanner) |
| HiPER Calc | Superior calculator | [gplay](https://play.google.com/store/apps/details?id=cz.hipercalc.pro) |
| DNS66 | Mobile hosts file | [fdroid](https://f-droid.org/en/packages/org.jak_linux.dns66) |
| Macros | Calorie Counter | [gplay](https://play.google.com/store/apps/details?id=com.josmantek.macros) |
| Relaxio | White-noise player | [gplay](https://play.google.com/store/apps/details?id=net.relaxio.relaxio) |
| M.A.L.P. | MPD client | [fdroid](https://f-droid.org/en/packages/org.gateshipone.malp) |
| My Expenses | Expense/income tracker, with exports | [f-droid](https://f-droid.org/repository/browse/?fdid=org.totschnig.myexpenses) [gplay](https://play.google.com/store/apps/details?id=org.totschnig.myexpenses) [github](https://github.com/mtotschnig/MyExpenses) |
| Dicer | Roll dices | [fdroid](https://f-droid.org/en/packages/org.secuso.privacyfriendlydicer) |
| Anki | Flashcards | [f-droid](https://f-droid.org/en/packages/com.ichi2.anki/) [gplay](https://play.google.com/store/apps/details?id=com.ichi2.anki) [github](https://github.com/ankidroid/Anki-Android) |
| KeePass DX | Mobile keepass database | [fdroid](https://f-droid.org/en/packages/com.kunzisoft.keepass.libre) |
| K-9 Mail | Mail | [fdroid](https://f-droid.org/en/packages/com.fsck.k9) [sync-setup](https://github.com/k9mail/k-9/issues/857#issuecomment-397109350) |
| Micopi+ | Generate profile picture for contacts | [fdroid](https://f-droid.org/en/packages/com.easytarget.micopi) |
| Time Meter | Smooth time tracker, with exports  | [gplay](https://play.google.com/store/apps/details?id=com.rk.timemeter) |
| StreetComplete | Simplified OSM contribution | [fdroid](https://f-droid.org/en/packages/de.westnordost.streetcomplete) |
| Tape Measure | Measure distances in an image | [fdroid](https://f-droid.org/en/packages/org.secuso.privacyfriendlytapemeasure) |
| Scrambled Exif | Remove metadata from images before sharing them | [fdroid](https://f-droid.org/en/packages/com.jarsilio.android.scrambledeggsif) |
| Binary Eye | QR reader | [fdroid](https://f-droid.org/en/packages/de.markusfisch.android.binaryeye) |
| DeuFeiTage | German holidays | [fdroid](https://f-droid.org/en/packages/de.micmun.android.deufeitage) |
| Voice | Audiobook player (more formats than audiopo, but inferior interface) | [fdroid](https://f-droid.org/en/packages/de.ph1b.audiobook) |
| MPDroid | Alternative MPD client | [fdroid](https://f-droid.org/en/packages/com.namelessdev.mpdroid) |

### Music setup

You can find a detailed account of my music related setup [here](manjaro/music.md)

## OSX

My osx install is no longer maintained, but you can still [explore the files here](https://github.com/jneidel/dotfiles/tree/bd758ada365a9fc2e7d4dc0b456684cfe88dc2bd/osx).

## Related

[generator-jneidel](https://github.com/jneidel/generator-jneidel) - My personal collection of boilerplates, for installation with yeoman

