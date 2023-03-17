local nnoremap  = require('utils').nnoremap

vim.api.nvim_command( 'let g:fern#renderer = "nerdfont"' )
vim.api.nvim_command( "let g:fern_git_status#disable_ignored = 1" )
vim.api.nvim_command( "let g:fern_git_status#disable_untracked = 1" )
vim.api.nvim_command( "let g:fern_git_status#disable_submodules = 1" )
vim.api.nvim_command( "let g:fern_git_status#disable_directories = 1" )
vim.api.nvim_command( "let g:fern#disable_default_mappings = 1" )

nnoremap( "<leader>f", ":Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>" )
