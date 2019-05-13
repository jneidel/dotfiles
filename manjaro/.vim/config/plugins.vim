" Vim plugins

"# Pathogen
" Plugin manager
" Add plugins under ~/.vim/bundle/<repo>
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

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

"## fugitive
" :Gwrite  to 'git add file', staging current file
" :Gread   to 'git checkout file', reseting current file to HEAD
" :Gremove to 'git rm file', removing the current file
" :Gmove   to 'git mv file file', update the current files path
" :Gcommit to 'git commit', opening the commit buffer
" :Gblame  to 'git blame file', opening a blame vsplit

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

"## eslint_d
au BufRead,BufNewFile *.js nnoremap <Leader>l mF:%!eslint_d --stdin --fix-to-stdout -c ~/.eslintrc<CR>`F
au BufRead,BufNewFile *.ts nnoremap <Leader>l mF:%!eslint_d --stdin --fix-to-stdout -c ~/.eslintrc-ts<CR>`F

"## prettier
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
" Run prettier on write
let g:prettier#autoformat = 0
