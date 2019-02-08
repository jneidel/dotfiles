" Set filetypes for specific files

" Calcurse notes buffer md syntax
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes* set filetype=markdown

autocmd BufRead ~/.eslintrc* set filetype=json

