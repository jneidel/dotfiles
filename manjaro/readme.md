# Manjaro

## Kitty (Terminal)

[Kitty Website](https://sw.kovidgoyal.net/kitty)

- [View my kitty config](.config/kitty/kitty.conf) `~/.config/kitty/kitty.conf`
- [View my kitty colorscheme](.config/kitty/jneidel-colors.conf) `~/.config/kitty/jneidel-colors.conf`

In the past I've used [Terminator](https://code.google.com/p/jessies/wiki/Terminator) in the past, but the project is unmaintained which caused a few problems (passing WM class does not work, images not rendered correctly). Additionally it has fewer relevant options and config management is a mess.

## Notes

- [Music setup](music.md) - A description of my music workflow

## Misc

**View youtube playlists in VLC:**

[Patch source](https://gist.github.com/seraku24/db42e0e418b2252f2136d2d7f1656be5)

```bash
sudo wget https://gist.githubusercontent.com/seraku24/db42e0e418b2252f2136d2d7f1656be5/raw/3b403b281a37565d5ff2b21ef3645e971fac7c77/149909-playlist_youtube-vlc3patch.lua -O /usr/lib/vlc/lua/playlist/playlist_youtube-vlc3patch.lua
```

Now you can use youtube playlists (format: `https://www.youtube.com/playlist?list=PL...`) in vlc.

