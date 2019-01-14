" Source https://www.youtube.com/watch?v=Q4I_Ft-VLAg

filetype plugin on

" :help key-notation
inoremap ,, <Esc>/<++><Enter>"_c4l
" nnoremap - normal mode

" HTML/pug
autocmd FileType html,pug inoremap ,a <a href=""><++></a><Space><++><Esc>F"i
autocmd FileType html,pug inoremap ,b <b></b><Space><++><Esc>2T>i
autocmd FileType html,pug inoremap ,i <i></i><Space><++><Esc>2T>i
autocmd FileType html,pug inoremap ,c <code></code><Space><++><Esc>2T>i

" Markdown
autocmd FileType markdown inoremap ,a [](<++>)<Space><++><Esc>F]i

" JavaScript
autocmd filetype javascript,typescript inoremap ,f function<Space>( <++> )<Space>{<Enter><++><Enter>}<Esc>2kf<2hi

" Typescript
autocmd filetype typescript inoremap ,c class<Space><Space>{<Enter>constructor( <++> )<Space>{<Enter><++><Enter>}<Enter>}<Esc>4kf{hi

