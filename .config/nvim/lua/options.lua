-- options

local o, indent = vim.opt, 2
local define_augroup = require('utils').define_augroup

-- file encoding
o.fileencoding = 'utf-8'

-- allow hidden buffers
o.hidden = true

-- enable relativenumbers
o.number = true
o.relativenumber = true

-- enable cursorline and show the signcolumn
o.cursorline = true
o.signcolumn = 'yes'

-- highlight search matches while typing and highlight every matching pattern
o.incsearch = true
o.hlsearch = true

-- ignore case in search and match case-sensitive if search contains uppercase
o.ignorecase = true
o.smartcase = true

-- allow <Backspace> to remove linebreaks
o.backspace = 'indent,eol,start'

-- round <Tab>s to multiples of tabstop/shiftwidth
o.shiftround = true

-- converts tabs to spaces
o.expandtab = true

-- number of spaces a <Tab> consists of
o.tabstop = indent

-- number of spaces to insert when indenting with >,<
o.shiftwidth = indent

-- number of spaces to remove when pressing <Backspace>
o.softtabstop = indent

-- automatic and smart indenting
o.smartindent = true
o.autoindent = true

-- time to wait for a mapped sequence to complete (in milliseconds) and faster completion
o.timeoutlen = 300
o.updatetime = 300

-- popup menu options and confirm to save changes in modified buffers
o.completeopt = 'menuone,noselect'
o.pumheight = 10
o.confirm = true

-- disable wrap, if on break lines at word
o.wrap = false
o.linebreak = true

-- split below and right
o.splitbelow = true
o.splitright = true

-- enable undo and disable swap files
o.undofile = true
o.swapfile = false

-- disable show mode and remove 'Pattern not found?' message
o.showmode = false
o.shortmess = 'c'

-- needed for italics, turned on by color highlight plugin
o.termguicolors = false

-- autocommands
define_augroup({
  utils = {
    { 'BufRead,BufNewFile', '*.tex', 'set filetype=tex' },
    { 'FileType', 'help,lspinfo,qf', 'nnoremap <buffer> <silent> q :q<CR>' },
    { 'TextYankPost', '*', 'lua vim.highlight.on_yank({ higroup = "Search", on_visual = false })' },
  },
})
