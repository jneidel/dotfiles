local utils = require("utils")
local bufnmap = utils.bufnmap

-- toggle spell check
bufnmap("<Leader>s", ":setlocal spell! spelllang=en_us,de<CR>")

vim.cmd("setlocal signcolumn=auto")
vim.cmd("setlocal textwidth=76") -- wrap text
vim.cmd("setlocal formatoptions+=t")
