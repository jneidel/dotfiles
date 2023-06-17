" Originally adapted from the 'An Old Hope' theme for Atom editor: https://github.com/j-tom/vim-old-hope
" Heavily customized by jneidel

" Functions
" Detect used t_Co
function! GetTCo()
  if exists("&t_Co")
    if (&t_Co > 255)
      let l:tCol=256
    elseif (&t_Co > 15 && &t_Co < 256)
      let l:tCol=16
    else
      let l:tCol=8
    endif
  else " no t_Co specified probably using GUI
    let l:tCol=256
    set t_Co=l:tCol
  endif

  return l:tCol
endfunction

" Set highlighting for the given group
function! SetHi(grp, fg, bg, opt)
  let l:gFg  = a:fg['GUI']
  let l:gBg  = a:bg['GUI']
  let l:gOpt = a:opt['GUI']
  let l:tFg  = a:fg['TERM']
  let l:tBg  = a:bg['TERM']
  let l:tOpt = a:opt['TERM']

  let l:hiStr= "hi! " .a:grp
             \ ." guifg="   . l:gFg
             \ ." guibg="   . l:gBg
             \ ." gui="     . l:gOpt
             \ ." ctermfg=" . l:tFg
             \ ." ctermbg=" . l:tBg
             \ ." cterm="   . l:tOpt
  execute l:hiStr
endfunction

" Link highlighting of one group to another
function! LinkHi(obj, target)
  execute "hi! link " .a:obj ." " .a:target
endfunction

" Reset colors to default colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Variables
let g:colors_name="old-hope"
" * Determine t_Co support
let s:tCol = GetTCo()

" Colors
" * GUI
let s:gWhite         = "#ffffff"
let s:gBlack         = "#000000"
let s:gVeryLightGrey = "#d0d0d0"
let s:gLightGrey     = "#8a8a8a"
let s:gGrey          = "#6c6c6c"
let s:gDarkGrey      = "#262626"
let s:gVeryDarkGrey  = "#1c1c1c"
let s:gRed           = "#d70000"
let s:gOrange        = "#ff5f00"
let s:gYellow        = "#ffd75f"
let s:gGreen         = "#00ff5f"
let s:gBlue          = "#00afff"

" * t_Co 256 (cterm)
let s:tWhite         = 15
let s:tBlack         = 0
let s:tVeryLightGrey = 252
let s:tLightGrey     = 245
let s:tGrey          = 242
let s:tDarkGrey      = 235
let s:tVeryDarkGrey  = 234
let s:tRed           = 160 " 203
let s:tOrange        = 202 " 166
let s:tYellow        = 221 " 222, 227
let s:tGreen         = 47  " 41
let s:tBlue          = 39  " 45

" Variables
let s:gFg = s:gVeryLightGrey
let s:tFg = s:tVeryLightGrey
let s:gBg = s:gVeryDarkGrey
let s:tBg = s:tVeryDarkGrey

let s:vBold          = {'GUI': "BOLD"          , 'TERM': "BOLD"          }
let s:vItalic        = {'GUI': "ITALIC"        , 'TERM': "ITALIC"        }
let s:vUnderline     = {'GUI': "UNDERLINE"     , 'TERM': "UNDERLINE"     }
let s:vNone          = {'GUI': "NONE"          , 'TERM': "NONE"          }
let s:vBoldItalic    = {'GUI': "BOLD,ITALIC"   , 'TERM': "BOLD,ITALIC"   }
let s:vFg            = {'GUI': s:gFg           , 'TERM': s:tFg           }
let s:vBg            = {'GUI': s:gBg           , 'TERM': s:tBg           }
let s:vWhite         = {'GUI': s:gWhite        , 'TERM': s:tWhite        }
let s:vBlack         = {'GUI': s:gBlack        , 'TERM': s:tBlack        }
let s:vVeryLightGrey = {'GUI': s:gVeryLightGrey, 'TERM': s:tVeryLightGrey}
let s:vLightGrey     = {'GUI': s:gLightGrey    , 'TERM': s:tLightGrey    }
let s:vGrey          = {'GUI': s:gGrey         , 'TERM': s:tGrey         }
let s:vDarkGrey      = {'GUI': s:gDarkGrey     , 'TERM': s:tDarkGrey     }
let s:vVeryDarkGrey  = {'GUI': s:gVeryDarkGrey , 'TERM': s:tVeryDarkGrey }
let s:vRed           = {'GUI': s:gRed          , 'TERM': s:tRed          }
let s:vOrange        = {'GUI': s:gOrange       , 'TERM': s:tOrange       }
let s:vYellow        = {'GUI': s:gYellow       , 'TERM': s:tYellow       }
let s:vGreen         = {'GUI': s:gGreen        , 'TERM': s:tGreen        }
let s:vBlue          = {'GUI': s:gBlue         , 'TERM': s:tBlue         }

" Highlight groups
" Basics
call SetHi ("Normal"        , s:vFg           , s:vBg           , s:vNone      )
call SetHi ("Underlined"    , s:vFg           , s:vBg           , s:vUnderline )
call SetHi ("Comment"       , s:vGrey         , s:vBg           , s:vNone      )
call SetHi ("Todo"          , s:vOrange       , s:vBg           , s:vNone      )
call SetHi ("Ignore"        , s:vGrey         , s:vBg           , s:vNone      )
" * Variable types
call SetHi ("Constant"      , s:vOrange       , s:vBg           , s:vNone      )
call LinkHi("Number"        , "Constant")
call LinkHi("Float"         , "Number")
call LinkHi("Boolean"       , "Constant")
call SetHi ("String"        , s:vBlue         , s:vBg           , s:vNone      )
call LinkHi("Character"     , "String")
" * Keywords
call SetHi ("Statement"     , s:vGreen        , s:vBg           , s:vNone      )
call LinkHi("Conditional"   , "Statement")
call LinkHi("Keyword"       , "Statement")
call LinkHi("Repeat"        , "Statement")
call LinkHi("Label"         , "Statement")
call LinkHi("Operator"      , "Statement")
" * PreProcessor macros
call SetHi ("Define"        , s:vGreen        , s:vBg           , s:vNone      )
call LinkHi("Include"       , "Define")
call LinkHi("Macro"         , "Define")
call LinkHi("PreCondit"     , "Define")
call LinkHi("PreProc"       , "Define")
" * Functions
call SetHi ("Identifier"    , s:vYellow       , s:vBg           , s:vNone      )
call LinkHi("Function"      , "Identifier")
" * Types
call SetHi ("Type"          , s:vRed          , s:vBg           , s:vNone      )
call LinkHi("Typedef"       , "Type")
call LinkHi("Structure"     , "Type")
call LinkHi("StorageClass"  , "Type")
" * Specials
call SetHi ("Special"       , s:vBlue         , s:vBg           , s:vNone      )
call LinkHi("SpecialChar"   , "Special")
call LinkHi("Tag"           , "Special")
call LinkHi("Delimiter"     , "Special")
call LinkHi("SpecialComment", "Special")
call LinkHi("SpecialKey"    , "Special")
call LinkHi("Debug"         , "Special")
" * Cursor
call SetHi ("Cursor"        , s:vBg           , s:vFg           , s:vNone      )
call LinkHi("iCursor"       , "Cursor")
call LinkHi("vCursor"       , "Cursor")
call LinkHi("lCursor"       , "Cursor")
" * Diff
call SetHi ("DiffAdd"       , s:vVeryDarkGrey , s:vGreen        , s:vNone      )
call SetHi ("DiffChange"    , s:vVeryDarkGrey , s:vYellow       , s:vNone      )
call SetHi ("DiffDelete"    , s:vVeryDarkGrey , s:vRed          , s:vNone      )
call SetHi ("DiffText"      , s:vNone         , s:vRed          , s:vNone      )
" * Errors
call SetHi ("Error"         , s:vVeryDarkGrey , s:vRed          , s:vBold      )
call SetHi ("ErrorMsg"      , s:vVeryDarkGrey , s:vRed          , s:vNone      )
call SetHi ("Exception"     , s:vYellow       , s:vBg           , s:vBold      )
" * Folding
call SetHi ("Folded"        , s:vLightGrey    , s:vDarkGrey     , s:vNone      )
call LinkHi("FoldColumn"    , "Folded")
" * Searching
call SetHi ("IncSearch"     , s:vVeryDarkGrey , s:vVeryLightGrey, s:vNone      )
call SetHi ("Search"        , s:vVeryDarkGrey , s:vOrange       , s:vNone      )
" * Other
call SetHi ("MatchParen"    , s:vYellow       , s:vBg           , s:vBold      )
call SetHi ("ModeMsg"       , s:vOrange       , s:vBg           , s:vNone      )
call SetHi ("Question"      , s:vOrange       , s:vBg           , s:vNone      )
" * Complete menu
call SetHi ("Pmenu"         , s:vWhite        , s:vDarkGrey     , s:vNone      )
call SetHi ("PmenuSel"      , s:vVeryDarkGrey , s:vGreen        , s:vBold      )
call SetHi ("PmenuSbar"     , s:vVeryDarkGrey , s:vVeryDarkGrey , s:vNone      )
call SetHi ("PmenuSbar"     , s:vGreen        , s:vVeryDarkGrey , s:vNone      )
" * Marks
call SetHi ("SignColumn"    , s:vFg           , s:vBg           , s:vNone      )
" GUI
call SetHi ("StatusLine"    , s:vFg           , s:vBg           , s:vBold      )
call SetHi ("StatusLineNC"  , s:vGrey         , s:vBg           , s:vBold      )
call SetHi ("Title"         , s:vOrange       , s:vNone         , s:vNone      )
call SetHi ("VertSplit"     , s:vRed          , s:vBg           , s:vBold      )
call SetHi ("VisualNOS"     , s:vNone         , s:vDarkGrey     , s:vNone      )
call SetHi ("Visual"        , s:vNone         , s:vDarkGrey     , s:vNone      )
call SetHi ("WarningMsg"    , s:vOrange       , s:vBg           , s:vNone      )
call SetHi ("WildMenu"      , s:vBlue         , s:vBg           , s:vNone      )
call SetHi ("Directory"     , s:vGreen        , s:vBg           , s:vBold      )
call SetHi ("TabLineFill"   , s:vVeryDarkGrey , s:vBg           , s:vNone      )
call SetHi ("TabLineSel"    , s:vLightGrey    , s:vBg           , s:vNone      )
call SetHi ("TabLine"       , s:vGrey         , s:vBg           , s:vNone      )
call SetHi ("CursorLineNr"  , s:vBlack        , s:vRed          , s:vBold      )
call SetHi ("CursorLine"    , s:vNone         , s:vDarkGrey     , s:vNone      )
call SetHi ("CursorColumn"  , s:vNone         , s:vVeryDarkGrey , s:vNone      )
call SetHi ("ColorColumn"   , s:vNone         , s:vVeryDarkGrey , s:vNone      )
call SetHi ("LineNr"        , s:vGrey         , s:vBg           , s:vNone      )
call SetHi ("NonText"       , s:vRed          , s:vBg           , s:vNone      )
" User colors for status line
call SetHi ("User1"         , s:vBlack        , s:vRed          , s:vBold      )
call SetHi ("User2"         , s:vRed          , s:vBg           , s:vBold      )
call SetHi ("User3"         , s:vFg           , s:vBg           , s:vBold      )

" make bold and italic available for neorg
call SetHi ('@text.strong'  , s:vFg           , s:vBg           , s:vBold      )
call SetHi ('@text.emphasis', s:vFg           , s:vBg           , s:vItalic    )

" Force dark background
set background=dark
