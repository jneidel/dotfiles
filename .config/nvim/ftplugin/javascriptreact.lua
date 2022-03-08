-- javascriptreact lsp
-- installation: sudo npm i -g typescript typescript-language-server

local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach

require('lspconfig').tsserver.setup {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascriptreact' },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}

-- automatically start lsp
vim.api.nvim_command(':LspStart')