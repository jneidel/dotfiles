-- json lsp
-- installation: sudo npm i -g vscode-langservers-extracted

local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach

require('lspconfig').jsonls.setup {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json' },
  init_options = {
    provideFormatter = true,
  },
  commands = {
    JSONFormat = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end
    },
  },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}

-- automatically start lsp
vim.api.nvim_command(':LspStart')
