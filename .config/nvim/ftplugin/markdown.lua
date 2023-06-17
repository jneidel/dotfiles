local utils = require("utils")
local bufnmap = utils.bufnmap
local nmap = utils.nmap

-- toggle spell check
bufnmap("<Leader>s", ":setlocal spell! spelllang=en_us,de<CR>")

-- wrap text at 80 chars
vim.cmd("setlocal textwidth=80")
vim.cmd("setlocal formatoptions+=t")

-- new line on Enter
nmap( "<Enter>", "o<Esc>" )

vim.b.coc_enabled = 0

-- something was overwriting these in nvim
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set backspace=2")
