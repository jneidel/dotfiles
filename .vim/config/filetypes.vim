"# vim filetypes
" set missing filetypes for specific files
" see: http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
"
" Structure:
" condition: au Filetype <filetype>
" condition: au BufRead <filepath>
" action   : setfiletype <filetype>
" action   : setlocal (to set options for this buffer only) <options>
"

" calcurse notes
au BufRead,BufNewFile /tmp/calcurse* setfiletype markdown
au BufRead,BufNewFile ~/.calcurse/notes* setfiletype markdown

" eslint configs
au BufRead *.eslintrc* ~/.eslint/* setfiletype json

" conky configs
au BufRead *conkyrc* setfiletype conkyrc
au BufRead ~/.config/conky/* setfiletype conkyrc

" spellchecking for Markdown files
au Filetype markdown setlocal spell spelllang=en_us,de
" toggle spellchecking
au Filetype markdown map <Leader>s :setlocal spell! spelllang=en_us,de<CR>
" wrap text at 80 characters
au Filetype markdown setlocal textwidth=80
au FileType markdown setlocal formatoptions+=t

" notes
au BufRead ~/code/notes/journal/* setfiletype markdown
au BufNewFile ~/code/notes/journal/* r!printf "\# thoughts on <++>\n\n"

" contacts
au BufRead ~/.contacts/* setfiletype conf

" enable javascript syntax folding
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
au BufWritePre *.js,*.ts,*.sh,*.pug,*.html,*.css,*.scss :call <SID>StripTrailingWhitespaces()

