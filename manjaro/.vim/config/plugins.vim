"# Pathogen
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" Pathogen plugins live in their directories
" under ~/.vim/bundle/<plugin-name>

"# Plugin configs
"## NERDTree
"### Aliases
let mapleader = "#"
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
let g:used_javascript_libs = 'underscore,react,flux,angularjs,ramda,vue,d3'

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

