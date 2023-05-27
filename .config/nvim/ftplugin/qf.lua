-- quickfix list
-- simple list of commands: https://stackoverflow.com/a/1747286
-- full list: https://neovim.io/doc/user/quickfix.html
local map = require("utils").map

map("n", "<CR>", ":.cc<CR>:cclose<CR>") -- go to entry
map("n", "<A-CR>", ":.cc<CR>:copen<CR>") -- preview entry
