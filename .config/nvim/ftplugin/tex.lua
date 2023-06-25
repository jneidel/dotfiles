-- latex lsp
-- installation: sudo pacman -S texlab

local bufnmap = require("utils").bufnmap

vim.cmd("let b:coc_enabled = 0")
vim.cmd("setlocal spell spelllang=en_us,de")

bufnmap("<Leader>s", ":setlocal spell! spelllang=en_us,de<CR>")
