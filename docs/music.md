# Music setup

<details>
<summary><strong>Table of Contents</strong></summary>

<!-- toc -->

- [download](#download)
- [tag](#tag)
  * [automatic](#automatic)
  * [semi-automatic](#semi-automatic)
  * [manual](#manual)
- [play](#play)

<!-- tocstop -->

</details>

## download

In order of preference:

- bandcamp (independent, minor label): [bandcamp-dl](https://github.com/iheanyi/bandcamp-dl)
- torrent (major label, small selection): [1337x](https://1337x.to), [tpb](https://proxybay.earth)
- soundcloud (major/minor label, big selection): [youtube-dl](https://github.com/rg3/youtube-dl), [real-debrid](https://real-debrid.com) (for paywalled content)
- youtube (everything, incomplete, bad versions): [youtube-dl](https://github.com/rg3/youtube-dl)

Support artists if you are able to.

- [youtube-dl aliases](../.zsh/apps.zsh) (see ytmp3)

## tag

All my music is stored as mp3 files. To automatically convert to mp3: [tomp3](../scripts/music/tomp3)

### automatic

[beets](https://github.com/beetbox/beets). Works for
everything in the [MusicBrainz](https://musicbrainz.org) db (label/official releases).

- [beetim](../scripts/music/beetim)
- [beets config](../.config/beets/config.yaml) (everything incl. cover & lyrics)
- [beets docs](https://beets.readthedocs.io/en/stable)
- check [apps](../apps) for beets plugin dependencies

### semi-automatic

[eyeD3](https://github.com/nicfit/eyeD3), with info
from file name or given by user.

- [tag-single](../scripts/music/tag-single)

```sh
# usage (refer to script --help for more)
tag-single *.mp3
tag-single -A "Black Muffin" *.mp3
tag-single -AA "Black Muffin" "Totem" *.mp3
```

### manual

- [mp3-tagging aliases](../.zsh/mp3-tagging.zsh)
- gui: [kid3](https://kid3.sourceforge.io)

## play

[mpd](https://wiki.archlinux.org/index.php/Music_Player_Daemon) + [ncmpcpp](https://wiki.archlinux.org/index.php/Ncmpcpp)

- [scripts](../scripts/mpd)
- [mpd.conf](../.config/mpd/mpd.conf)
- [ncmpcpp configs](../.config/ncmpcpp)
- [control mpd via keybindings](../scripts/sxhkd/control-mpd)
- [Lukes setup](https://www.youtube.com/watch?v=sZIEdI9TS2U)
