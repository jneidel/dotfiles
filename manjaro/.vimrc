"# Vim

"## Colors
syntax on
set t_Co=256
colorscheme old-hope

"## Lines
set number relativenumber
set ruler
set cursorline

"## General
set nocompatible
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent "set smartindent

" Enable autocomplete
set wildmode=longest,list,full

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"## Backup/Swap files
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/tmp
set undofile
set undodir=~/.vim/tmp

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
" Hightlight wrongly spelled words
  hi SpellBad ctermbg=167
  hi SpellRare ctermbg=none
  hi SpellLocal ctermbg=none
  hi SpellCap ctermbg=none

"## Sessions
" Dont write vimrc option to sessionfile - vimrc changes would be overwritten by old ones
" source: https://stackoverflow.com/a/31978241
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
set viminfo=%,'50,\"100,:100,n~/.viminfo

"## Misc

" Write file with sudo, eventhough vim wasnt opened with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Disable automatic commenting on newline
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" ^ not working

" Spell-check set to <leader>o, 'o' for 'orthography'
"map <leader>o :setlocal spell! spelllang=en_us<CR>
" ^ not working

" iab jn jneidel

" continue with , as sep
" set dict=~/.vim/dict.vim

" write file after losing focus, or leaving the window
au FocusLost,WinLeave * :silent! w " Doesnt trigger on i3 windows
" read file after regaining focus, entering the buffer
"au FocusGained,BufEnter * :silent! !
au BufEnter * :silent! !
" source: https://stackoverflow.com/a/20418591
" maybe checkout: https://stackoverflow.com/a/8610556
set autoread " takes 5s
au CursorHold * checktime

" Run markdown-toc on save
autocmd BufWritePost ~/code/dotfiles/videos.md !markdown-toc -i ~/code/dotfiles/videos.md
autocmd BufWritePost ~/code/dotfiles/readme.md !markdown-toc -i ~/code/dotfiles/readme.md

" Increment/Decrement next number
" src: https://vim.fandom.com/wiki/Increasing_or_decreasing_numbers
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent> <C-y> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>

"## Source external configs/plugins
source ~/.vim/config/init.vim

