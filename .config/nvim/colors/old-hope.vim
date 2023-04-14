" Originally adapted from the 'An Old Hope' theme for Atom editor: https://github.com/j-tom/vim-old-hope
" Heavily customized by jneidel

" Reset colors to default colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Variables
let g:colors_name="old-hope"
" * Determine t_Co support
let s:tCol = oldhope#GetTCo()

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
call oldhope#SetHi ("Normal"        , s:vFg           , s:vBg           , s:vNone      )
call oldhope#SetHi ("Underlined"    , s:vFg           , s:vBg           , s:vUnderline )
call oldhope#SetHi ("Comment"       , s:vGrey         , s:vBg           , s:vNone      )
call oldhope#SetHi ("Todo"          , s:vOrange       , s:vBg           , s:vNone      )
call oldhope#SetHi ("Ignore"        , s:vGrey         , s:vBg           , s:vNone      )
" * Variable types
call oldhope#SetHi ("Constant"      , s:vOrange       , s:vBg           , s:vNone      )
call oldhope#LinkHi("Number"        , "Constant")
call oldhope#LinkHi("Float"         , "Number")
call oldhope#LinkHi("Boolean"       , "Constant")
call oldhope#SetHi ("String"        , s:vBlue         , s:vBg           , s:vNone      )
call oldhope#LinkHi("Character"     , "String")
" * Keywords
call oldhope#SetHi ("Statement"     , s:vGreen        , s:vBg           , s:vNone      )
call oldhope#LinkHi("Conditional"   , "Statement")
call oldhope#LinkHi("Keyword"       , "Statement")
call oldhope#LinkHi("Repeat"        , "Statement")
call oldhope#LinkHi("Label"         , "Statement")
call oldhope#LinkHi("Operator"      , "Statement")
" * PreProcessor macros
call oldhope#SetHi ("Define"        , s:vGreen        , s:vBg           , s:vNone      )
call oldhope#LinkHi("Include"       , "Define")
call oldhope#LinkHi("Macro"         , "Define")
call oldhope#LinkHi("PreCondit"     , "Define")
call oldhope#LinkHi("PreProc"       , "Define")
" * Functions
call oldhope#SetHi ("Identifier"    , s:vYellow       , s:vBg           , s:vNone      )
call oldhope#LinkHi("Function"      , "Identifier")
" * Types
call oldhope#SetHi ("Type"          , s:vRed          , s:vBg           , s:vNone      )
call oldhope#LinkHi("Typedef"       , "Type")
call oldhope#LinkHi("Structure"     , "Type")
call oldhope#LinkHi("StorageClass"  , "Type")
" * Specials
call oldhope#SetHi ("Special"       , s:vBlue         , s:vBg           , s:vNone      )
call oldhope#LinkHi("SpecialChar"   , "Special")
call oldhope#LinkHi("Tag"           , "Special")
call oldhope#LinkHi("Delimiter"     , "Special")
call oldhope#LinkHi("SpecialComment", "Special")
call oldhope#LinkHi("SpecialKey"    , "Special")
call oldhope#LinkHi("Debug"         , "Special")
" * Cursor
call oldhope#SetHi ("Cursor"        , s:vBg           , s:vFg           , s:vNone      )
call oldhope#LinkHi("iCursor"       , "Cursor")
call oldhope#LinkHi("vCursor"       , "Cursor")
call oldhope#LinkHi("lCursor"       , "Cursor")
" * Diff
call oldhope#SetHi ("DiffAdd"       , s:vVeryDarkGrey , s:vGreen        , s:vNone      )
call oldhope#SetHi ("DiffChange"    , s:vVeryDarkGrey , s:vYellow       , s:vNone      )
call oldhope#SetHi ("DiffDelete"    , s:vVeryDarkGrey , s:vRed          , s:vNone      )
call oldhope#SetHi ("DiffText"      , s:vNone         , s:vRed          , s:vNone      )
" * Errors
call oldhope#SetHi ("Error"         , s:vVeryDarkGrey , s:vRed          , s:vBold      )
call oldhope#SetHi ("ErrorMsg"      , s:vVeryDarkGrey , s:vRed          , s:vNone      )
call oldhope#SetHi ("Exception"     , s:vYellow       , s:vBg           , s:vBold      )
" * Folding
call oldhope#SetHi ("Folded"        , s:vLightGrey    , s:vDarkGrey     , s:vNone      )
call oldhope#LinkHi("FoldColumn"    , "Folded")
" * Searching
call oldhope#SetHi ("IncSearch"     , s:vVeryDarkGrey , s:vVeryLightGrey, s:vNone      )
call oldhope#SetHi ("Search"        , s:vVeryDarkGrey , s:vOrange       , s:vNone      )
" * Other
call oldhope#SetHi ("MatchParen"    , s:vYellow       , s:vBg           , s:vBold      )
call oldhope#SetHi ("ModeMsg"       , s:vOrange       , s:vBg           , s:vNone      )
call oldhope#SetHi ("Question"      , s:vOrange       , s:vBg           , s:vNone      )
" * Complete menu
call oldhope#SetHi ("Pmenu"         , s:vWhite        , s:vDarkGrey     , s:vNone      )
call oldhope#SetHi ("PmenuSel"      , s:vVeryDarkGrey , s:vGreen        , s:vBold      )
call oldhope#SetHi ("PmenuSbar"     , s:vVeryDarkGrey , s:vVeryDarkGrey , s:vNone      )
call oldhope#SetHi ("PmenuSbar"     , s:vGreen        , s:vVeryDarkGrey , s:vNone      )
" * Marks
call oldhope#SetHi ("SignColumn"    , s:vFg           , s:vBg           , s:vNone      )
" GUI
call oldhope#SetHi ("StatusLine"    , s:vFg           , s:vBg           , s:vBold      )
call oldhope#SetHi ("StatusLineNC"  , s:vGrey         , s:vBg           , s:vBold      )
call oldhope#SetHi ("Title"         , s:vOrange       , s:vNone         , s:vNone      )
call oldhope#SetHi ("VertSplit"     , s:vRed          , s:vBg           , s:vBold      )
call oldhope#SetHi ("VisualNOS"     , s:vNone         , s:vDarkGrey     , s:vNone      )
call oldhope#SetHi ("Visual"        , s:vNone         , s:vDarkGrey     , s:vNone      )
call oldhope#SetHi ("WarningMsg"    , s:vOrange       , s:vBg           , s:vNone      )
call oldhope#SetHi ("WildMenu"      , s:vBlue         , s:vBg           , s:vNone      )
call oldhope#SetHi ("Directory"     , s:vGreen        , s:vBg           , s:vBold      )
call oldhope#SetHi ("TabLineFill"   , s:vVeryDarkGrey , s:vBg           , s:vNone      )
call oldhope#SetHi ("TabLineSel"    , s:vLightGrey    , s:vBg           , s:vNone      )
call oldhope#SetHi ("TabLine"       , s:vGrey         , s:vBg           , s:vNone      )
call oldhope#SetHi ("CursorLineNr"  , s:vBlack        , s:vRed          , s:vBold      )
call oldhope#SetHi ("CursorLine"    , s:vNone         , s:vDarkGrey     , s:vNone      )
call oldhope#SetHi ("CursorColumn"  , s:vNone         , s:vVeryDarkGrey , s:vNone      )
call oldhope#SetHi ("ColorColumn"   , s:vNone         , s:vVeryDarkGrey , s:vNone      )
call oldhope#SetHi ("LineNr"        , s:vGrey         , s:vBg           , s:vNone      )
call oldhope#SetHi ("NonText"       , s:vRed          , s:vBg           , s:vNone      )
" User colors for status line
call oldhope#SetHi ("User1"         , s:vBlack        , s:vRed          , s:vBold      )
call oldhope#SetHi ("User2"         , s:vRed          , s:vBg           , s:vBold      )
call oldhope#SetHi ("User3"         , s:vFg           , s:vBg           , s:vBold      )

" make bold and italic available for neorg
call oldhope#SetHi ('@text.strong'  , s:vFg           , s:vBg           , s:vBold      )
call oldhope#SetHi ('@text.emphasis', s:vFg           , s:vBg           , s:vItalic    )

" Force dark background
set background=dark
