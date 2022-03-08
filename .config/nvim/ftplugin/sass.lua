-- sass lsp
-- installation: sudo npm i -g vscode-langservers-extracted

--[[ local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'sass', 'scss' },
  capabilities = capabilities,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    sass = { validate = true },
  },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}

-- emmet lsp
-- installation: sudo npm i -g ls_emmet
require('lspconfig/configs').ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' },
    filetypes = { 'sass', 'scss' },
    root_dir = root_dir,
    on_attach = custom_on_attach,
  },
}
require('lspconfig').ls_emmet.setup { capabilities = capabilities }

-- automatically start lsp
vim.api.nvim_command(':LspStart') ]]
