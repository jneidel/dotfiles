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

" Reload buffer on changes to file after 5s
set autoread
au CursorHold * checktime