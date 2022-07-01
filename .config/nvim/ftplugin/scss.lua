-- scss lsp
-- installation: sudo npm i -g vscode-langservers-extracted

-- local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'scss' },
  capabilities = capabilities,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    sass = { validate = true },
  },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}

vim.api.nvim_cmd({ cmd = 'LspStart' }, {})
