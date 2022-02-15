-- sh lsp
-- installation: sudo npm i -g bash-language-server

local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach

require('lspconfig').bashls.setup {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh' },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}

-- automatically start lsp
vim.api.nvim_command(':LspStart')
