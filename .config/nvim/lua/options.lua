-- options

local o = vim.opt

-- file encoding
o.fileencoding = 'utf-8'

-- allow hidden buffers without forcing them (!)
-- a hidden buffer is one with unsaved changed not currently open
o.hidden = true

-- enable relativenumbers
o.number = true
o.relativenumber = true

-- enable cursorline and show the signcolumn
o.cursorline = true
o.signcolumn = 'auto'

-- highlight search matches while typing and highlight every matching pattern
o.incsearch = true
o.hlsearch = false -- activate manually

-- ignore case in search and match case-sensitive if search contains uppercase
o.ignorecase = true
o.smartcase = true

-- round <Tab>s to multiples of tabstop/shiftwidth
o.shiftround = true

-- converts tabs to spaces
o.expandtab = true

local indent = 2
-- number of spaces a <Tab> consists of
o.tabstop = indent
-- number of spaces to insert when indenting with >,<
o.shiftwidth = indent
-- number of spaces to remove when pressing <Backspace>
o.softtabstop = indent
-- automatic and smart indenting
-- allow <Backspace> to remove linebreaks
o.backspace = 'indent,eol,start'
-- explaination of above settings: http://vimcasts.org/episodes/tabs-and-spaces

-- activate automatic indention based on syntax files
o.smartindent = true
-- and based on static rules
o.autoindent = true

-- time to wait for a mapped sequence to complete (in milliseconds) and faster completion
o.timeoutlen = 300
o.updatetime = 300

-- popup menu options and confirm to save changes in modified buffers
o.completeopt = 'menuone,noselect'
o.pumheight = 10
o.confirm = true

-- wrap line, if on break lines at word
o.wrap = true
o.linebreak = true

-- split below and right
o.splitbelow = true
o.splitright = true

-- enable undo and disable swap files
o.undofile = true
o.swapfile = false

-- disable show mode
o.showmode = false
-- disable annoying ENTER to continue on opening a new file and 'Pattern not found?' message
o.shortmess = 'cF'
-- set shortmess+=F

-- needed for italics, turned on by color highlight plugin
o.termguicolors = false

-- syntax highlighting
vim.cmd( "syntax on" )

local is_light_mode = vim.fn.system("cat /tmp/light-mode 2>/dev/null")
if is_light_mode == "1" then
  vim.cmd("colorscheme light")
else
  vim.cmd("colorscheme old_hope")
end

-- enable autocomplete
o.wildmode = "longest,list,full"

-- blink cursor on error instead of beeping
o.visualbell = true

-- color current horizontal line
o.cursorline = true
-- set as 'CursorLine' in colorscheme to style

-- check first lines of file for vim commands to execute
-- turned off for security
o.modelines = 0

local STATE_HOME = os.getenv( "XDG_STATE_HOME" ) or os.getenv( "HOME" ) .. "/.local/share"
os.execute( "mkdir -p " ..
STATE_HOME .. "/nvim/backup " ..
STATE_HOME .. "/nvim/undo " ..
STATE_HOME .. "/nvim/session "
)

-- backups
o.backup = true
o.writebackup = true
o.backupdir = STATE_HOME .. "/nvim/backup"

-- undo
o.undofile = true
o.undodir = STATE_HOME .. "/.vim/undo"

-- sessions
vim.cmd( "source ~/.config/nvim/vimscript/sessions.vim" )

-- rest of old .vimrc
vim.cmd( "source ~/.config/nvim/vimscript/vimrc.vim" )

vim.cmd( "set spellfile=$XDG_STATE_HOME/nvim/spell/en.utf-8.add,$XDG_STATE_HOME/nvim/spell/de.utf-8.add" )
