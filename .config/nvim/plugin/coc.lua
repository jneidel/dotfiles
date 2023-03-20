-- to disable autocomplete suggestions:
--   suggest.autoTrigger: "none" in :CocConfig

-- Extensions provide additional features
vim.g.coc_global_extensions  = {
  "coc-tsserver", -- js
  "coc-highlight", -- show colors behind colorcodes
  "coc-texlab", -- latex completions
  "@yaegassy/coc-phpstan", -- php static analyser
  "coc-php-cs-fixer" -- php linter
}
-- See extensions: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
-- Look into:
--  coc-git - for git blame, github/lab issue references, status on line basis
--  coc-html-css-support - css completion in html
--  coc-html - completion
--  coc-css - go to defintion
--  coc-spell-checker - integrated spell checking (how different from existing )
--
--  https://github.com/yaegassy/coc-phpstan - linting
--  https://github.com/yaegassy/coc-php-cs-fixer - formatting

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300 -- default is 4000, which is quite slow

-- vim.api.nvim_command( "source ~/.config/nvim/vimscript/coc.vim" )

-- :CocCommand php-cs-fixer.fix
