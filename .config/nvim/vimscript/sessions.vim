"## Sessions

" Dont write vimrc option to sessionfile - vimrc changes would be overwritten by old ones
" source: https://stackoverflow.com/a/31978241
set sessionoptions-=options

function! GetSessionFileName(mkdirEnclosing)
  let b:sessiondirSpaces = $XDG_STATE_HOME . "/nvim/session" . getcwd()
  let b:sessiondir = substitute(b:sessiondirSpaces, " ", "²", "g")
  " replace spaces with ² because mksession goes crazy if it receives an
  " argument with spaces
  let b:sessionfile = b:sessiondir . "/session.vim"

  if (a:mkdirEnclosing && filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' . b:sessiondir
    redraw!
  endif

  return b:sessionfile
endfunction

function! MakeSession()
  let b:sessionfile = GetSessionFileName(1)

  exe 'mksession! ' . b:sessionfile
endfunction

function! LoadSession()
  let b:sessionfile = GetSessionFileName(0)

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
