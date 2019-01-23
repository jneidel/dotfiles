" To be used with youtube-local: https://github.com/jneidel/youtube-local
" Take youtube link from current line and do something with it

" vlc
map <leader>yy /http<Enter>:noh<Enter>"1y$0:!vlc -q --fullscreen --no-repeat --no-random --audio-desync=-250 "<C-R>1"<cr>

" youtube-dl
map <leader>yd /http<Enter>:noh<Enter>"1y$0:!echo "Started mp4 download"; youtube-dl -q -c --retries 4 -f 'mp4[height=720]' -o '~/Downloads/\%(title)s.\%(ext)s' "<C-R>1" &<cr>
map <leader>ym /http<Enter>:noh<Enter>"1y$0:!echo "Started mp3 download"; youtube-dl -q -c --retries 4 -x --audio-format 'mp3' -o '~/Downloads/\%(title)s.\%(ext)s' "<C-R>1" &<cr>

