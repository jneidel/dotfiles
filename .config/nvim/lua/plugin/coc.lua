local utils = require("utils")
local nmap = utils.nmap
local nnoremap = utils.nnoremap

return {
  config = function()
    -- to disable autocomplete suggestions:
    --   suggest.autoTrigger: "none" in :CocConfig

    -- Extensions provide additional features
    vim.g.coc_global_extensions  = {
      "coc-tsserver", -- js
      "coc-highlight", -- show colors behind colorcodes
      "coc-texlab", -- latex completions
      "@yaegassy/coc-phpstan", -- php static analyser
      "coc-php-cs-fixer", -- php linter
      "coc-phpactor", -- php lsp
      "coc-lua", -- lua lsp
    }
    -- See extensions: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
    -- Look into:
    --  coc-git - for git blame, github/lab issue references, status on line basis
    --  coc-html-css-support - css completion in html
    --  coc-html - completion
    --  coc-css - go to defintion
    --  coc-spell-checker - integrated spell checking (how different from existing )
    --  upgrade phpactor: https://phpactor.readthedocs.io/en/master/lsp/code-actions.html
    --
    --  https://github.com/yaegassy/coc-phpstan - linting
    --  https://github.com/yaegassy/coc-php-cs-fixer - formatting

    vim.opt.signcolumn = "yes"
    vim.opt.updatetime = 300 -- default is 4000, which is quite slow

    nmap( "gd", "<Plug>(coc-definition)" )
    nmap( "gr", "<Plug>(coc-references)" )
    nmap( "<leader>r", "<Plug>(coc-rename)" ) -- rename under cursor

    nnoremap( "K", ":call <CMD>lua _G.show_docs()<CR>" ) -- show docs for under cursor
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    -- nmap( "gy", "<Plug>(coc-type-definition" )
    -- nmap( "gi", "<Plug>(coc-implementation)" )
  end
}
