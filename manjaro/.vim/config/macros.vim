" Source https://www.youtube.com/watch?v=Q4I_Ft-VLAg

filetype plugin on

" :help key-notation
inoremap ,, <Esc>/<++><Enter>"_c4l

" HTML/pug
autocmd FileType html,pug inoremap ,a <a href=""><++></a><Space><++><Esc>F"i
autocmd FileType html,pug inoremap ,b <b></b><Space><++><Esc>2T>i
autocmd FileType html,pug inoremap ,i <i></i><Space><++><Esc>2T>i
autocmd FileType html,pug inoremap ,c <code></code><Space><++><Esc>2T>i

" Markdown
autocmd FileType markdown,md inoremap ,a [](<++>)<Space><++><Esc>F]i

" nnoremap - normal mode

