" Set filetypes for specific files
" info: http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
"
" Structure
" condition: autocmd Filetype <filetype>
" condition: autocmd BufRead <filepath>
" do       : setlocal (to set options for this buffer only)
"

" Calcurse notes buffer md syntax
autocmd BufRead,BufNewFile /tmp/calcurse* setfiletype markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes* setfiletype markdown

" JSON syntax for eslint configs
autocmd BufRead ~/.eslintrc* setfiletype json

" Spellchecking for Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us,de

" Enable javascript syntax folding
augroup javascript_folding
  au!
  "au FileType javascript setlocal foldmethod=syntax
  nnoremap <Leader>f :setlocal foldmethod=syntax<Enter>
augroup END

" Automatically remove trailing whitespace
" see: http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
  " Save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Replace
  %s/\s\+$//e
  " Restore cursor position and last search
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre *.js,*.ts,*.sh,*.pug,*.html,*.css,*.scss :call <SID>StripTrailingWhitespaces()


