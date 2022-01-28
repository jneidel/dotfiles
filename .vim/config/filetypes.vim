"# vim filetypes
" set missing filetypes for specific files
" see: http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
"
" Structure:
" condition: au Filetype <filetype>
" condition: au BufRead <filepath>
" action   : setfiletype <filetype>
" action   : setlocal (to set options for this buffer only) <options>

" todo file
au BufRead ~/todo setfiletype markdown

" eslint configs
au BufRead *.eslintrc* ~/.eslint/* setfiletype json

" conky configs
au BufRead *conkyrc* setfiletype conkyrc
au BufRead ~/.config/conky/* setfiletype conkyrc

" spellchecking for Markdown files
" au Filetype markdown setlocal spell spelllang=en_us,de
" toggle spellchecking
au Filetype markdown,tex map <Leader>s :setlocal spell! spelllang=en_us,de<CR>
" wrap text at 80 characters
au Filetype markdown setlocal textwidth=80
au FileType markdown setlocal formatoptions+=t

" remap enter to create a newline
au Filetype markdown nmap <Enter> o<Esc>
" interesting is a filler word that does not say anything
au Filetype markdown match error /[iI]nteresting/

" notes
au BufRead ~/code/notes/journal/* setfiletype markdown

" contacts
au BufRead ~/.contacts/* setfiletype conf

" shell scripts
au Filetype shell,zsh,bash,sh map <leader>k :w<CR> :!shellcheck -e SC2006,SC1090,SC1001,SC2086 %<CR>
" Todo: how can I close preview window on 0 exit code

" remind
autocmd FileType remind setlocal commentstring=#\ %s

" fragmentshader / vertexshader
au BufRead *.fragmentshader setfiletype cpp
au BufRead *.vertexshader setfiletype cpp

" octave
au FileType octave set ft=matlab
