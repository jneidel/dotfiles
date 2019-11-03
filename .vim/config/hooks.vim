"# vim hooks
" run something after a specific file changes
" list of events: http://tech.saigonist.com/b/code/list-all-vim-script-events.html

" run markdown-toc on save
au BufWritePost ~/code/dotfiles/videos.md !markdown-toc -i ~/code/dotfiles/videos.md
au BufWritePost ~/code/dotfiles/readme.md !markdown-toc -i ~/code/dotfiles/readme.md
au BufWritePost ~/code/dotfiles/manjaro/music.md !markdown-toc -i ~/code/dotfiles/readme.md

" run xrdb whenever Xdefaults or Xresources are updated
au BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" generate eslint configs on save and restart eslint daemon
au BufWritePost ~/.eslint/*.json !~/.eslint/generate-eslint-configs.js
au BufWritePost ~/.eslint/*.json !eslint_d restart

" restart sxhdk on config write
au BufWritePost ~/.config/sxhkd/sxhkdrc !kill $(pidof sxhkd); sxhkd &

" restart dunst on config write
au BufWritePost ~/.config/dunst/dunstrc !kill $(pidof dunst); dunst &

" sync manga/comics on opening of updates file
au BufRead,BufEnter ~/manga/updates silent !mangasync
au BufRead ~/comics/updates silent !comicsync

" format fcrontab buffer after writing
au BufWritePost /tmp/fcr-* silent %!column -t

