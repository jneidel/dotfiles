" old-hope colorscheme for lightline

let s:yellow = [ '#ffd75f' , 221 ]
let s:blue = [ '#00afff' , 39 ]
let s:darkBlue = [ '#005fd7' , 26 ]
let s:red = [ '#d70000' , 160 ]
let s:green = [ '#00ff5f' , 47 ]
let s:orange = [ '#ff5f00' , 202 ]
let s:white = [ '#ffffff' , 15 ]
let s:lightGray = [ '#8a8a8a' , 245 ]
let s:gray = [ '#6c6c6c' , 242 ]
let s:darkGray = [ '#262626' , 235 ]
let s:veryDarkGray = [ '#1c1c1c' , 234 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:veryDarkGray, s:darkBlue ], [ s:red, s:veryDarkGray ] ]
let s:p.insert.left = [ [ s:veryDarkGray, s:green ], [ s:red, s:veryDarkGray ] ]
let s:p.visual.left = [ [ s:veryDarkGray, s:orange ], [ s:red, s:veryDarkGray ] ]
let s:p.replace.left = [ [ s:veryDarkGray, s:red ], [ s:red, s:veryDarkGray ] ]
let s:p.inactive.right = [ [ s:darkGray, s:veryDarkGray ], [ s:darkGray, s:veryDarkGray ] ]
let s:p.inactive.left = [ [ s:red, s:veryDarkGray ], [ s:white, s:veryDarkGray ] ]
let s:p.inactive.middle = [ [ s:white, s:veryDarkGray ] ]
let s:p.normal.middle = [ [ s:white, s:veryDarkGray ] ]
let s:p.normal.error = [ [ s:red, s:darkGray ] ]
let s:p.normal.warning = [ [ s:orange, s:darkGray ] ]
let s:p.tabline.left = [ [ s:gray, s:veryDarkGray ] ]
let s:p.tabline.tabsel = [ [ s:darkGray, s:red ] ]
let s:p.tabline.middle = [ [ s:yellow, s:veryDarkGray ] ]
let s:p.normal.right = [ [ s:gray, s:veryDarkGray ], [ s:white, s:gray ] ]
let s:p.insert.right = [ [ s:gray, s:veryDarkGray ], [ s:white, s:gray ] ]
let s:p.visual.right = [ [ s:gray, s:veryDarkGray ], [ s:white, s:gray ] ]
let s:p.replace.right = [ [ s:gray, s:veryDarkGray ], [ s:white, s:gray ] ]
let s:p.tabline.right = [ [ s:gray, s:veryDarkGray ], [ s:white, s:gray ] ]

let g:lightline#colorscheme#old_hope#palette = lightline#colorscheme#flatten(s:p)

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
\   "colorscheme": "old_hope",
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
