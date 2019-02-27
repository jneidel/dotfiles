# Music setup

> Detailed description of my setup for playing music

All my music is stored as mp3 files, so my setup is organized around mp3 specific programms.

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [cmus](#cmus)
- [beets](#beets)
  * [id3tag, lame, ffmpeg (Manual CLI mp3 tagging)](#id3tag-lame-ffmpeg-manual-cli-mp3-tagging)
  * [kid3](#kid3)
- [youtube-dl](#youtube-dl)
- [Scripts to interact with cmus](#scripts-to-interact-with-cmus)

<!-- tocstop -->

</details>

## [cmus](https://github.com/cmus/cmus) (Player)

My music player is the light-weight, keyboard-based cmus.

It has everything I want from a music player:

- Vim shortcuts
- Speed
- Perfect layout
- Queues, Playlists, etc
- Command-line interface (`cmus-remote`)

cmus specific files: [rc](https://github.com/jneidel/dotfiles/blob/master/manjaro/.cmus/rc), [theme](https://github.com/jneidel/dotfiles/blob/master/manjaro/.cmus/cmus.theme)

## [beets](https://github.com/beetbox/beets) (mp3 tagging)

beets automatically corrects mp3 tags, renames files based on their tags, moves them to the correct location and add the covers and lyrics. Thus ensuring consistency in my `~/music` directory, as well as correctly taged files.

```bash
# Requires dependencies for fetching covers, lyrics
# Install either through pacman:
sudo pacman -S python-beautifulsoup4 python-requests
# Or pip:
sudo pip install beautifulsoup4 requests
```

beets specific files: [config.yaml](https://github.com/jneidel/dotfiles/blob/master/manjaro/.config/beets/config.yaml)

### id3tag, lame, ffmpeg (Manual CLI mp3 tagging)

beets uses MusicBrainz database for tagging, so if you want to tag individual songs or ones that aren't in the database (i.e. smaller artists, e.g. from soundcloud) you have to do it 'manually'.

For that I have a handful of aliases, e.g. `idar Logic *` to apply the artist tag 'Logic' to all songs in the cwd.

[View aliases](https://github.com/jneidel/dotfiles/blob/master/manjaro/.zsh/cmus.zsh#L14)

### [kid3](https://kid3.sourceforge.io/) (Manual GUI mp3 tagging)

Sometimes I use kid3 to quickly clean up the tags (set cover on multiple files, get artist/title from file-name, etc).

## [youtube-dl](https://github.com/rg3/youtube-dl) (Downloader)

I use youtube-dl for easy mass download of youtube playlists or soundcloud sets.

```shell
# Extract audio and save it in ~/Downloads
youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/%(title)s.%(ext)s'
```

View [aliases](https://github.com/jneidel/dotfiles/blob/master/manjaro/.zsh/apps.zsh#L17) in context

## Scripts to interact with cmus

**Control with keyboard shortcuts:**

Using keyboard shortcuts, set in my [i3-config](https://github.com/jneidel/dotfiles/blob/master/manjaro/.i3/config#L79), I can [play/pause](https://github.com/jneidel/dotfiles/blob/master/manjaro/scripts/i3/cmus/play-pause.sh) and play the [next](https://github.com/jneidel/dotfiles/blob/master/manjaro/scripts/i3/cmus/next.sh) or [previous](https://github.com/jneidel/dotfiles/blob/master/manjaro/scripts/i3/cmus/previous.sh) song.

```shell
cmus-remote -u # play/pause
cmus-remote -n # next
cmus-remote -r # prev
```

[View scripts](https://github.com/jneidel/dotfiles/tree/master/manjaro/scripts/i3/cmus) a more detailed setup

**Print current song in tmux bar:**

Using `cmus-remote -Q` you can get information on the current song. My tmux bar runs a script to check if a song is running and then prints available information.

View: [.tmux.conf](https://github.com/jneidel/dotfiles/blob/master/manjaro/.tmux.conf#L37), [script that fetches info](https://github.com/jneidel/dotfiles/blob/master/manjaro/.tmux/cmus-current-track)

**Display cover of current song:**

As in the previous example, get the data from `cmus-remote -Q`, save it to a temporary file and open it in [sxiv](https://github.com/muennich/sxiv) (simple img viewer): [View script](https://github.com/jneidel/dotfiles/blob/master/manjaro/.zsh/cmus.zsh#L24)

I also wrote a version that updates the cover automatically once the song changes, but it still a bit buggy: [View script](https://github.com/jneidel/dotfiles/blob/master/manjaro/.zsh/cmus.zsh#L44)

**Display lyrics of current song:**

Using ffmpegs `ffprobe` you can get the lyrics tag of a given song:

[get-lyrics](https://github.com/jneidel/dotfiles/blob/master/manjaro/scripts/get-lyrics) (of a given song), [get-cmus-lyrics](https://github.com/jneidel/dotfiles/blob/master/manjaro/scripts/get-cmus-lyrics) (get lyrics for current song)

