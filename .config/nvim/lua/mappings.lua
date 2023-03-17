local map = require("utils").map

-- leader key
vim.g.mapleader = '#'
map('n', '<Space>', '')

-- better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- better window resizing
map('n', '<C-S-l>', ':lua require("utils").resize(true, 3)<CR>')
map('n', '<C-S-h>', ':lua require("utils").resize(true, -3)<CR>')
map('n', '<C-S-j>', ':lua require("utils").resize(false, 3)<CR>')
map('n', '<C-S-k>', ':lua require("utils").resize(false, -3)<CR>')

-- better tab switching
map('n', '<TAB>', ':tabnext<CR>')
map('n', '<S-TAB>', ':tabprevious<CR>')

-- visal mode
---- indenting
map('v', '>', '>gv')
map('v', '<', '<gv')
---- moving lines
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')
-- move selected line/text
-- map('n', '<C-j>', ':m .+1<CR>==')
-- map('n', '<C-k>', ':m .-2<CR>==')

-- write file with ZW, like ZZ and ZQ
map('n', 'ZW', ':write<CR>')

-- remove hlsearch
-- map('n', '<leader><Space>', ':nohlsearch<CR>')
-- toggle wrap
-- map('n', '<leader>w', ':set wrap!<CR>')

-- placeholders
map('i', ',,', '<Esc>/<++><CR>c4l')
-- map('n', '<leader>,', '<Esc>/<++><CR>c4l')

-- zen-mode
-- map('n', '<leader>z', ':ZenMode<CR>')

-- hop
-- map('n', 's', ':HopChar2<CR>')
-- map('n', 'S', ':HopWord<CR>')
