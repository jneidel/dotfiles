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

-- emmet lsp
-- installation: sudo npm i -g ls_emmet
--[[ require('lspconfig/configs').ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' },
    filetypes = { 'html' },
    root_dir = root_dir,
    on_attach = custom_on_attach,
  },
}
require('lspconfig').ls_emmet.setup { capabilities = capabilities } ]]

-- automatically start lsp
vim.api.nvim_command(':LspStart')
