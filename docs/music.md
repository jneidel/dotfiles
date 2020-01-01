# Music setup

> Detailed description of my setup for playing music

All my music is stored as mp3 files, so my setup is organized around mp3 specific programms.

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [beets](#beets)
  * [id3tag, lame, ffmpeg (Manual CLI mp3 tagging)](#id3tag-lame-ffmpeg-manual-cli-mp3-tagging)
  * [kid3](#kid3)
- [youtube-dl](#youtube-dl)
- [Scripts to interact with mpd](#scripts-to-interact-with-mpd)

<!-- tocstop -->

</details>

<!--## mpd/ncmpcpp-->

## [beets](https://github.com/beetbox/beets) (mp3 tagging)

beets automatically corrects mp3 tags, renames files based on their tags, moves them to the correct location and add the covers and lyrics. Thus ensuring consistency in my `~/music` directory, as well as correctly taged files.

beets specific files: [config.yaml](https://github.com/jneidel/dotfiles/blob/master/.config/beets/config.yaml)

```bash
# My plugins require additional dependencies for fetching covers, lyrics
# Install either through pacman:
sudo pacman -S python-beautifulsoup4 python-requests
# Or pip:
sudo pip install beautifulsoup4 requests
```

### id3tag, lame, ffmpeg (Manual CLI mp3 tagging)

beets uses MusicBrainz database for tagging, so if you want to tag individual songs or ones that aren't in the database (i.e. smaller artists, e.g. from soundcloud) you have to do it 'manually'.

For that I have a handful of aliases, e.g. `idar Logic *` to apply the artist tag 'Logic' to all songs in the cwd.

[View aliases](https://github.com/jneidel/dotfiles/blob/master/.zsh/mp3-tagging.zsh)

### [kid3](https://kid3.sourceforge.io/) (Manual GUI mp3 tagging)

Sometimes I use kid3 to quickly clean up the tags (set cover on multiple files, get artist/title from file-name, etc).

## [youtube-dl](https://github.com/rg3/youtube-dl) (Downloader)

I use youtube-dl for easy mass download of youtube playlists or soundcloud sets.

```shell
# Extract audio and save it in ~/Downloads
youtube-dl --yes-playlist -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/%(title)s.%(ext)s'
```

View [aliases](https://github.com/jneidel/dotfiles/blob/master/.zsh/apps.zsh#L17) in context

## Scripts to interact with mpd

[View all scripts](https://github.com/jneidel/dotfiles/tree/master/scripts/mpd).

Keyboard shortcuts: [sxhkd config](https://github.com/jneidel/dotfiles/blob/master/.config/sxhkd/sxhkdrc#L39).

