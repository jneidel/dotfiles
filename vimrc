"### Colorscheme
syntax on
set t_Co=256
colorscheme old-hope

" Lines
set number
set ruler

"###
set nocompatible
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
"set smartindent

set autoread " Watch for file changes

" Backup/Swap files
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/tmp
set undofile
set undodir=~/.vim/tmp

" Save history/registers after :q session
set viminfo=%,'50,\"100,:100,n~/.viminfo

"### Window Spliting
" Remapping ctrl + w + <movement> to ctrl + <movement> for easier window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow " on vsp
set splitright " on sp

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us "Spellchecking for Markdown files

"##### Plugins

"### Aliases
let mapleader = "#"
nmap <leader>tt  :NERDTreeToggle<cr>
nmap <leader>tc  :NERDTreeClose<cr>

"### NERDTree options
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

"### MiniBufExpl

map <Leader>mt :MBEToggle<cr>

"### Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"### Pathogen  

execute pathogen#infect()
call pathogen#helptags()


"####################################################

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
