-- html lsp
-- installation: sudo npm i -g vscode-langservers-extracted

local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
  capabilities = capabilities,
  init_options = {
    configurationSection = { 'html', 'css', 'javascript' },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}
