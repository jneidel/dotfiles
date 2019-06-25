"# Pathogen
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" Pathogen plugins live in their directories
" under ~/.vim/bundle/<plugin-name>

"# Plugin configs
"## NERDTree
"### Aliases
nmap <leader>tt  :NERDTreeToggle<cr>
nmap <leader>tc  :NERDTreeClose<cr>
"### Options
let NERDTreeSortHiddenFirst=0
let NERDTreeCaseSensitiveSort=0
let NERDTreeShowHidden=0
let NERDTreeShowFiles=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=1
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeWinSize=25
let NERDTreeIgnore=[ "\.git", "\.DS_Store" ]

"## tagbar
nmap <F8> :TagbarToggle<CR>

"## javascript-libraries-syntax
let g:used_javascript_libs = 'react,underscore,ramda,vue,d3'

"## tern
" Make use of these in the future:
"   TernRename - rename var under cursor
"   TernDef    - jump to definition
"   TernType   - find out type of thing under cursor
"   TernDoc    - look up docs for smt
"
" Research more tern functionality:
"   https://github.com/Valloric/YouCompleteMe#javascript-semantic-completion

"## syntastic
" Recommanded configs
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Check eslint on :w
let g:syntastic_check_on_wq = 1
" Activate checking on js files with eslint
let g:syntastic_javascript_checkers = ["eslint"]
" Add other checkers:
" https://github.com/vim-syntastic/syntastic/blob/9e1b2a8620a0ff48a9f4e42a6e09b65a34ad2a6a/doc/syntastic-checkers.txt

"## fugitive
" :Gwrite  to 'git add file', staging current file
" :Gread   to 'git checkout file', reseting current file to HEAD
" :Gremove to 'git rm file', removing the current file
" :Gmove   to 'git mv file file', update the current files path
" :Gcommit to 'git commit', opening the commit buffer
" :Gblame  to 'git blame file', opening a blame vsplit

"## nerdcommenter
" <leader> c <space> to toggle comment
" <leader> cc        to comment

"## numbers
nnoremap <F3> :NumbersToggle<CR>

"## fold (built-in)
" Save folds at leave
" au BufWinLeave * mkview
" Load folds on enter
" au BufWinEnter * silent loadview

"## html5
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"## Goyo
nmap <leader>gy :Goyo<cr>
nmap <leader>gj :Goyo<cr>:set textwidth=80<cr>:set formatoptions+=t<cr>

"## prettier
" Run prettier
nmap <Leader>p <Plug>(Prettier)

" Run prettier on write
let g:prettier#autoformat = 0
"au Filetype javascript,typescript,css,json,html,yaml au BufWritePre * PrettierAsync
"au BufWritePre *.js,*.ts,*.css,*.json,*.html,*.jsx,*.mjs,*.tsx,*.scss,*.graphql,*.vue PrettierAsync

au BufRead,BufNewFile *.js nnoremap <Leader>e mF:%!eslint_d --stdin --fix-to-stdout -c ~/.eslintrc<CR>`F
au BufRead,BufNewFile *.ts nnoremap <Leader>e mF:%!eslint_d --stdin --fix-to-stdout -c ~/.eslintrc-ts<CR>`F
"au BufWritePre *.js :%!eslint_d --stdin --fix-to-stdout

" Autofix entire buffer with eslint_d:
"nnoremap <leader>i mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

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

