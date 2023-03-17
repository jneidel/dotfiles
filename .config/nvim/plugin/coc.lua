-- to disable autocomplete suggestions:
--   suggest.autoTrigger: "none" in :CocConfig

-- Extensions provide additional features
-- vim.g.coc_global_extensions  = { "coc-tsserver", "coc-json", "coc-html", "coc-css", "coc-highlight", "coc-yank", "coc-texlab" }
vim.g.coc_global_extensions  = { "coc-tsserver" }
-- See extensions: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
-- Look into:
--  coc-git for git blame, github/lab issue references, status on line basis

vim.opt.signcolumn = "no"
vim.opt.updatetime = 300 -- default is 4000, which is quite slow

-- vim.api.nvim_command( "source ~/.config/nvim/vimscript/coc.vim" )
