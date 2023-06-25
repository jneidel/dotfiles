local utils = require("utils")
local bufnmap = utils.bufnmap

-- toggle spell check
bufnmap("<Leader>s", ":setlocal spell! spelllang=en_us,de<CR>")

-- wrap text at 80 chars
vim.cmd("setlocal textwidth=80")
vim.cmd("setlocal formatoptions+=t")
