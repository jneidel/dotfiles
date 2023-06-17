"## Sessions
" Dont write vimrc option to sessionfile - vimrc changes would be overwritten by old ones
" source: https://stackoverflow.com/a/31978241

" don't store vim options (config) in session
set ssop-=options

function! MakeSession()
  let b:sessiondir = $XDG_STATE_HOME . "/nvim/session" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $XDG_STATE_HOME . "/nvim/session" . getcwd()
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
