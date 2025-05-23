" Vim config
" If you are using vim for the first time you might want to start
" with simpler setup, because this one will break if not setup correctly.
" For basic setup see: https://gist.github.com/simonista/8703722

" remove search highlighting, deselect/hide matches
map <leader><space> :nohls<Enter>

" number of lines visable while scrolling (in the scroll direction)
set scrolloff=6

set mouse=

" external formatting program
set formatprg=par\ w76
"   on arch: aur/par
" format current block of text and remove indention
" nmap <leader>g {j0v99<v}gq
nmap <leader>g {v}:!par w76<Enter>}

" set whitespace characters
set listchars=tab:▸\ ,eol:¬
"   activate   :set list
"   deactivete :set nolist

" invert splits; the defaults are inverted, which is counter intuitive
set splitbelow " on sp
set splitright " on vsp

" toggle paste mode
" set pastetoggle=<F5> broken

" unmap ex mode, src: https://unix.stackexchange.com/a/180927
map Q <Nop>

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

" Enable folding
" Set foldmethod=snytax if current language has fold support
set foldmarker={{{,}}}
set foldmethod=marker
set foldlevel=2

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

" open buffer menu
nnoremap <A-b> :b<Space>

" shorten vert sb, src: https://stackoverflow.com/a/56798858
cabbrev vb vert sb
cabbrev vsb vert sb

" write file after losing focus, or leaving the window
au FocusLost,WinLeave * :silent! w! " Doesnt trigger on i3 windows

" read file after regaining focus, entering the buffer
" was this required? just throws errors on nvim
" au BufEnter * :silent! !
" source: https://stackoverflow.com/a/20418591
" maybe checkout: https://stackoverflow.com/a/8610556

set autoread " takes 5s
" au CursorHold * checktime
" throws errors

" Increment/decrement next number
" src: https://vim.fandom.com/wiki/Increasing_or_decreasing_numbers
" Overwrites scroll screen on ^y
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent> <C-x> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <C-c> :<C-u>call AddSubtract("\<C-x>", '')<CR>

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

" Goyo: quit vim with ZZ
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
