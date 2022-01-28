"# vim plugins

"## pathogen
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" pathogen plugins live in their directories
" under ~/.vim/bundle/<plugin-name>

"## javascript-libraries-syntax
let g:used_javascript_libs = 'react,underscore,ramda,vue,d3'

"## numbers
nnoremap <F3> :NumbersToggle<CR>

"## fold (built-in)
" Save folds at leave
" au BufWinLeave * mkview
" Load folds on enter
" au BufWinEnter * silent loadview

"## html5-syntax
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"## goyo
let g:goyo_width = 84
nmap <leader>w :Goyo<cr>:set textwidth=80<cr>:set formatoptions+=t<cr>:set nornu<cr>:set scrolloff=0<cr>
autocmd BufLeave goyo_pad setlocal norelativenumber
function! s:goyo_enter()
  set norelativenumber
  set nonumber
endfunction
function! s:goyo_leave()
  set relativenumber
  set number
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:numbers_exclude = ['goyo_pad']

"## prettier
" Run prettier
nmap <Leader>p <Plug>(Prettier)

" Max line length that prettier will wrap on
let g:prettier#config#print_width = 80

" Number of spaces per indentation level
let g:prettier#config#tab_width = 2

" Use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" Print semicolons
let g:prettier#config#semi = 'true'

" Single quotes over double quotes
let g:prettier#config#single_quote = 'false'

" Print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" Put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'

" Include parentheses around a sole arrow function parameter (avoid|always)
let g:prettier#config#arrow_parens = 'avoid'

" Print trailing commas wherever possible when multi-line (none|es5|all)
let g:prettier#config#trailing_comma = 'all'

" Specify which parser to use (flow|babylon|typescript)
let g:prettier#config#parser = 'babylon'

" Wrap prose if it exceeds the print width (always|never|preserve)
let g:prettier#config#prose_wrap = 'always'

" Specify the global whitespace sensitivity for HTML files (css|strict|ignore)
let g:prettier#config#html_whitespace_sensitivity = 'css'

" How config file should be evaluated in combination with CLI options (cli-override|file-override|prefer-file)
let g:prettier#config#config_precedence = 'cli-override'

"## eslint
" using eslint_d (npm i -g eslint_d)
au filetype js,javascript,vue nnoremap <Leader>e mF:%!eslint_d --stdin --fix-to-stdout -c ~/.config/eslint/eslintrc --resolve-plugins-relative-to /usr/lib/node_modules<CR>`F
au filetype ts,typescript nnoremap <Leader>e mF:%!eslint_d --stdin --fix-to-stdout -c ~/.config/eslint/eslintrc-ts --resolve-plugins-relative-to /usr/lib/node_modules --parser '@typescript-eslint/parser' <CR>`F

"## coc
let g:coc_global_extensions = "coc-tsserver coc-json coc-html coc-css coc-highlight coc-yank"

" only use coc for specific filetypes
" au Filetype * silent CocDisable
" au Filetype javascript,typescript,json,bash,shell,sh,js,ts,html,css,sass CocEnable

"### Solutions to possible problems
" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

"### gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show type, function definition, etc.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" rename current word
nmap <leader>rn <Plug>(coc-rename)

"## lightline

" activate the bar
set laststatus=2

" hide -- INSERT -- in line below statusline
set noshowmode

" import colorscheme palette
source ~/.vim/colors/OldHope-lightline.vim

" remove file type if it's empty (instead of no-ft)
function! LightlineFiletype()
  return (&filetype !=# '' ? &filetype : '')
endfunction

" remove RO label on help files (and other plugin buffers)
function! LightlineReadonly()
  return &readonly && &filetype !=# '\v(help|vimfiler)' ? 'RO' : ''
endfunction

" remove | between the modified + and the filename
" and change the filename to be relative path instead of just the name
function! LightlineFilename()
  let filename = expand('%:f') !=# '' ? expand('%:f') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

"### lightline json config
" component_function: process the value before displaying it
" active/inactive: the contents of the statusbar of active/inactive windows
let g:lightline = {
\   "colorscheme": "OldHope",
\   "component_function": {
\     "filetype": "LightlineFiletype",
\     "readonly": "LightlineReadonly",
\     "filename": "LightlineFilename",
\   },
\   "active": {
\     "right": [ [ "filetype" ] ],
\     "left":  [ [ "staticGlyph", "mode", "paste" ], [ "readonly", "filename" ] ],
\   },
\   "inactive": {
\     "right": [],
\     "left":  [ [ "filename" ] ],
\   },
\   "tabline": { "right": [] },
\   "tab": {
\     "active": [ "filename" ],
\     "inactive": [ "filename" ],
\   },
\   "tabline_separator": { "left": "", "right": "" },
\   "subseparator": { "left": "", "right": "" },
\ }

" # sneak
let g:sneak#s_next = 1

" # vim markdown
" docs: https://github.com/plasticboy/vim-markdown#options
let g:vim_markdown_follow_anchor = 1 " ge to follow: [local](file.md#myheader)
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'current' " current, vsplit, hsplit

let g:vim_markdown_folding_style_pythonic = 1 " fold on headlines
let g:vim_markdown_folding_level = 2 " ## is unfolded at open

let g:vim_markdown_new_list_item_indent = 0

" concealing: https://github.com/plasticboy/vim-markdown#syntax-concealing
set conceallevel=2
let g:tex_conceal = ""
let g:vim_markdown_math = 0
let g:vim_markdown_strikethrough = 1

" # fern - file explorer
nnoremap <leader>f :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>
let g:fern#renderer = "nerdfont"
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1
let g:fern_git_status#disable_directories = 1
let g:fern#disable_default_mappings = 1

au Filetype fern nmap <buffer> <CR> <Plug>(fern-action-open-or-enter)
au Filetype fern nmap <buffer> L <Plug>(fern-action-open) :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>
au Filetype fern nmap <buffer> l <Plug>(fern-action-open-or-expand)
au Filetype fern nmap <buffer> h <Plug>(fern-action-collapse)
au Filetype fern nmap <buffer> H <Plug>(fern-action-leave)
au Filetype fern nmap <buffer> K <Plug>(fern-action-leave)
au Filetype fern nmap <buffer> J <Plug>(fern-action-expand)
au Filetype fern nmap <buffer> <BS> <Plug>(fern-action-leave)

au Filetype fern nmap <buffer> u <Plug>(fern-action-hidden:toggle)
au Filetype fern nmap <buffer> rm <Plug>(fern-action-remove)
" au Filetype fern nmap <buffer> t <Plug>(fern-action-new-file)
" au Filetype fern nmap <buffer> d <Plug>(fern-action-new-dir)

" tips: https://github.com/lambdalisue/fern.vim/wiki/Tips

au Filetype fern nmap <buffer> t <Plug>(fern-action-open:tabedit)
au Filetype fern nmap <buffer> s <Plug>(fern-action-open:side) :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>
au Filetype fern nmap <buffer> v <Plug>(fern-action-open:below) :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>
" au Filetype fern nmap <buffer>
" <Plug>(fern-action-open:select)
" <Plug>(fern-action-open:system)
" open:below

au Filetype fern nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)

" au Filetype fern nmap <buffer> <++>

