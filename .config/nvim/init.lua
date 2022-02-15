-- https://github.com/nanotee/nvim-lua-guide#introduction
-- https://github.com/jasper-schnabel/neovim
-- https://github.com/ChristianChiarulli/LunarVim

require( "plugins" )
require( "options" )
require( "mappings" )

vim.api.nvim_command( "set runtimepath^=~/.vim runtimepath+=~/.vim/after" )
vim.api.nvim_command( "let &packpath = &runtimepath" )
vim.api.nvim_command( "source ~/.vimrc" )
