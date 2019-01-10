"# Vim

"## Colors
syntax on
set t_Co=256
colorscheme old-hope

"## Lines
set number
set ruler
set cursorline

"## General
set nocompatible
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
"set smartindent
set autoread " Watch for file changes

"## Backup/Swap files
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/tmp
set undofile
set undodir=~/.vim/tmp

" Save history/registers after :q session
set viminfo=%,'50,\"100,:100,n~/.viminfo

"## Search
set ic  " Ignore case
set hls " Highlight matches 
set is  " Highlight during writing

"## Windows
" Remapping ctrl + w + <movement> to ctrl + <movement> for easier window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow " on vsp
set splitright " on sp

" Reload buffer on changes to file after 5s
set autoread
au CursorHold * checktime

"## Custom coloring
" Current tab in tabline
  hi TabLineSel ctermfg=Red
" Current status line
  hi StatusLine ctermfg=Red
" Vertical Split line
  hi VertSplit ctermfg=Red
" Number of splits, next to tab
  hi Title ctermfg=Yellow

" Spellchecking for Markdown files 
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
" Wrongly spelled words
  hi SpellBad ctermbg=167
  hi SpellRare ctermbg=none
  hi SpellLocal ctermbg=none
  hi SpellCap ctermbg=none

source ~/.vim/config/plugins.vim
source ~/.vim/config/ide.vim

" iab jn jneidel

" continue with , as sep
" set dict=~/.vim/dict.vim

" Write file with sudo, eventhough vim wasnt opened with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"## Sessions
" Dont write vimrc option to sessionfile - vimrc changes would be overwritten
" by old ones
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
" source make/load session:
" https://stackoverflow.com/questions/1642611/how-to-save-and-restore-multiple-different-sessions-in-vim#1642641
                                          
" Load session automatically if no filename is provided
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
endif
" Create session automatically on leave
au VimLeave * :call MakeSession()

" Calcurse notes buffer md syntax
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes* set filetype=markdown
