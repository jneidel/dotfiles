-- mappings

local default_options = { noremap = true, silent = true }
local function map( mode, binding, functionality, options )
  if (options == nil) then
    options = default_options
  end

  return vim.api.nvim_set_keymap( mode, binding, functionality, options )
end

-- leader key
vim.g.mapleader = ' '
map('n', '<Space>', '')

-- better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- better window resizing
map('n', '<C-Right>', ':lua require("utils").resize(true, 3)<CR>')
map('n', '<C-Left>', ':lua require("utils").resize(true, -3)<CR>')
map('n', '<C-Down>', ':lua require("utils").resize(false, 3)<CR>')
map('n', '<C-Up>', ':lua require("utils").resize(false, -3)<CR>')

-- better buffer switching
map('n', '<TAB>', ':bnext<CR>')
map('n', '<S-TAB>', ':bprevious<CR>')

-- better indenting
map('v', '>', '>gv')
map('v', '<', '<gv')

-- write file with ZW, like ZZ and ZQ
map('n', 'ZW', ':write<CR>')

-- move selected line/text
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- keep J centered
map('n', 'J', 'mzJ`z')

-- remove hlsearch
map('n', '<leader><Space>', ':nohlsearch<CR>')

-- goto previous match
map('n', '//', '//<CR>')

-- toggle wrap
map('n', '<leader>w', ':set wrap!<CR>')

-- placeholders
map('i', ',,', '<Esc>/<++><CR>c4l')
map('n', '<leader>,', '<Esc>/<++><CR>c4l')

-- zen-mode
map('n', '<leader>z', ':ZenMode<CR>')

-- hop
map('n', 's', ':HopChar2<CR>')
map('n', 'S', ':HopWord<CR>')

-- nvimtree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- snap
map('n', '<leader>f', ':Snap find_files<CR>')
map('n', '<leader>fl', ':Snap live_grep<CR>')
map('n', '<leader>fg', ':Snap git_files<CR>')
map('n', '<leader>fr', ':Snap recent_files<CR>')
map('n', '<leader>fb', ':Snap buffers<CR>')
