"# vim plugins

"## pathogen
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" pathogen plugins live in their directories
" under ~/.vim/bundle/<plugin-name>

"## javascript-libraries-syntax
let g:used_javascript_libs = 'react,underscore,ramda,vue,d3'

"## numbers
nnoremap <F3> :NumbersToggle<CR>

"## fold (built-in)
" Save folds at leave
" au BufWinLeave * mkview
" Load folds on enter
" au BufWinEnter * silent loadview

"## html5-syntax
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"## goyo
let g:goyo_width = 84
nmap <leader>gy :Goyo<cr>:set textwidth=80<cr>:set formatoptions+=t<cr>:set nornu<cr>

"## prettier
" Run prettier
nmap <Leader>p <Plug>(Prettier)

" Max line length that prettier will wrap on
let g:prettier#config#print_width = 80

" Number of spaces per indentation level
let g:prettier#config#tab_width = 2

" Use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" Print semicolons
let g:prettier#config#semi = 'true'

" Single quotes over double quotes
let g:prettier#config#single_quote = 'false'

" Print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" Put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'

" Include parentheses around a sole arrow function parameter (avoid|always)
let g:prettier#config#arrow_parens = 'avoid'

" Print trailing commas wherever possible when multi-line (none|es5|all)
let g:prettier#config#trailing_comma = 'all'

" Specify which parser to use (flow|babylon|typescript)
let g:prettier#config#parser = 'babylon'

" Wrap prose if it exceeds the print width (always|never|preserve)
let g:prettier#config#prose_wrap = 'always'

" Specify the global whitespace sensitivity for HTML files (css|strict|ignore)
let g:prettier#config#html_whitespace_sensitivity = 'css'

" How config file should be evaluated in combination with CLI options (cli-override|file-override|prefer-file)
let g:prettier#config#config_precedence = 'cli-override'

" ## eslint
" using eslint_d (npm i -g eslint_d)
au BufRead,BufNewFile *.js nnoremap <Leader>e mF:%!eslint_d --stdin --fix-to-stdout -c ~/.eslintrc<CR>`F
au BufRead,BufNewFile *.ts nnoremap <Leader>e mF:%!eslint_d --stdin --fix-to-stdout -c ~/.eslintrc-ts<CR>`F

