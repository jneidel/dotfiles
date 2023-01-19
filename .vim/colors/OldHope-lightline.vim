" old-hope colorscheme

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

let g:lightline#colorscheme#OldHope#palette = lightline#colorscheme#flatten(s:p)
