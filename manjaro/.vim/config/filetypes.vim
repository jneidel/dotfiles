" Set filetypes for specific files

" Calcurse notes buffer md syntax
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes* set filetype=markdown

autocmd BufRead ~/.eslintrc* set filetype=json

" Spellchecking for Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.de.md setlocal spell spelllang=de
