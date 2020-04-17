" Vim config
" If you are using vim for the first time you might want to start
" with simpler setup, because this one will break if not setup correctly.
" For basic setup see: https://gist.github.com/simonista/8703722

" not vi compatible
set nocompatible

" encoding
set encoding=utf-8

" syntax highlighting
syntax on

" activate 256 colors
set t_Co=256

" set colorscheme
colorscheme old-hope
"   file in ~/.vim/colors/old-hope.vim
"   see: https://github.com/j-tom/vim-old-hope.git

" linenumbers, in normal mode numbers will be relative to the current line
set number relativenumber

" blink cursor on error instead of beeping
set visualbell

" color current horizontal line
set cursorline
"   set as 'CursorLine' in colorscheme to style

" wrap content to next line when display width is reached
set wrap

" replace tab characters with spaces
set expandtab
" number of spaces a <Tab> consists of
set tabstop=2
" number of spaces to insert when indenting with >,<
set shiftwidth=2
" number of spaces to remove when pressing <Backspace>
set softtabstop=2
" allows <Backspace> to remove linebreaks
set backspace=2
"   explaination of above settings: http://vimcasts.org/episodes/tabs-and-spaces

" round <Tab>s to multiples of tabstop/shiftwidth
set shiftround

" activate automatic indention based on syntax files
set autoindent
" and based on static rules
set smartindent

" check first lines of file for vim commands to execute
" turned off for security
set modelines=0

" allow hidden buffers without forcing them (!)
" a hidden buffer is one with unsaved changed not currently open
set hidden

" defines <leader> key
let mapleader = "#"

" enable autocomplete
set wildmode=longest,list,full

" highlight search matches while typing
set incsearch
" dont highlight search matches at startup
set nohlsearch

" ignore search case
set ignorecase
" enforce case if search contains uppercase
set smartcase

" remove search highlighting, deselect/hide matches
map <leader><space> :nohls<Enter>

" number of lines visable while scrolling (in the scroll direction)
set scrolloff=6

" external formatting program
set formatprg=par\ -w80
"   on arch: aur/par
" format current block of text and remove indention
nmap <leader>g {j0v99<v}gq

" set whitespace characters
set listchars=tab:▸\ ,eol:¬
"   activate   :set list
"   deactivete :set nolist

" backup files
set backup
set writebackup
set backupdir=~/.vim/backup
" swap files - destroyed two important files
" set swapfile
" set directory=~/.vim/tmp
" undo files
set undofile
set undodir=~/.vim/tmp

" invert splits; the defaults are inverted, which is counter intuitive
set splitbelow " on sp
set splitright " on vsp

" remap ^w + <movement> to ^<movement> for easier window changing
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" toggle paste mode
set pastetoggle=<F5>

" custom coloring
" current tab in tabline
  hi TabLineSel ctermfg=Red
" current status line
  hi StatusLine ctermfg=Red
" vertical Split line
  hi VertSplit ctermfg=Red
" number of splits, in tabline next to tab
  hi Title ctermfg=Yellow

" only highlight wrongly spelled words
  hi SpellBad ctermbg=167
  hi SpellRare ctermbg=none
  hi SpellLocal ctermbg=none
  hi SpellCap ctermbg=none

" TODO: cleanup descriptions below
"## Sessions
" Dont write vimrc option to sessionfile - vimrc changes would be overwritten by old ones
" source: https://stackoverflow.com/a/31978241

" don't store vim options (config) in session
set ssop-=options

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
    else
    echo "No session loaded."
  endif
endfunction

" Load session automatically if no filename is provided
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
endif
" Create session automatically on leave
au VimLeave * :call MakeSession()

" Save history/registers after :q session
set viminfo=%,'20,<100,:20
" this throws weird errors on every startup
" set viminfofile=/home/jneidel/.vim/tmp/viminfo

" Enable folding
" Set foldmethod=snytax if current language has fold support
set foldmarker={{{,}}}
set foldmethod=marker

" copy to and from clipboard
" src: https://vim.fandom.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
vmap <leader>c :!xclip -f -sel clip<CR>
map <leader>v mz:-1r !xclip -o -sel clip<CR>`z

" Write file with sudo, eventhough vim wasn't opened with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Disable automatic commenting on newline
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" ^ not working

" iab jn jneidel

" set dict=~/.vim/dict.vim

" quick replace
nnoremap <C-s> :%s//g<Left><Left>

" sort a block of text
nnoremap <leader>S {jv}k$:!sort<CR>

" open fzf
nnoremap <A-f> :F<CR>

" open buffer menu
nnoremap <A-b> :b<Space>

" write file after losing focus, or leaving the window
au FocusLost,WinLeave * :silent! w " Doesnt trigger on i3 windows
" read file after regaining focus, entering the buffer
"au FocusGained,BufEnter * :silent! !
au BufEnter * :silent! !
" source: https://stackoverflow.com/a/20418591
" maybe checkout: https://stackoverflow.com/a/8610556
set autoread " takes 5s
au CursorHold * checktime

" Increment/decrement next number
" src: https://vim.fandom.com/wiki/Increasing_or_decreasing_numbers
" Overwrites scroll screen on ^y
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent> <C-y> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>

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

" au BufWritePre *.js,*.ts,*.sh,*.pug,*.html,*.css,*.scss,*.md :call <SID>StripTrailingWhitespaces()
au BufWritePre * :call <SID>StripTrailingWhitespaces()

" Save cursor position before writing and restore after writing
function! SaveCursorPosition()
  let a:cursor_pos = getpos(".")
  call setpos('.', a:cursor_pos)
  winsaveview()
  winrestview()
endfunction
" ^ not working, was supposed to mitigate eslint resetting the cursor location

" source other modular configs files
source ~/.vim/config/init.vim

