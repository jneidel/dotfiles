-- https://github.com/nanotee/nvim-lua-guide#introduction
-- https://github.com/jasper-schnabel/neovim
-- https://github.com/ChristianChiarulli/LunarVim

-- import files in ./lua/
require( "options" )
require( "plugins" )
require( "mappings" )

vim.cmd( "set runtimepath^=~/.vim runtimepath+=~/.vim/after" )
vim.cmd( "let &packpath = &runtimepath" )
vim.cmd( "source ~/.vimrc" )
vim.cmd( "colorscheme old-hope" ) -- has to be after vimrc
