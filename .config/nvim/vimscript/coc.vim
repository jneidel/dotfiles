let g:coc_filetypes_enable = ['ts', 'json', 'js', 'jsx', 'tsx', 'lua']

function! s:disable_coc_for_type()
  if index(g:coc_filetypes_enable, &filetype) == -1
    :silent! CocDisable
  else
    :silent! CocEnable
  endif
endfunction

augroup CocGroup
 autocmd!
 autocmd BufNew,BufEnter,BufAdd,BufCreate * call s:disable_coc_for_type()
augroup end
