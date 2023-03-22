-- installation: sudo npm i -g typescript typescript-language-server

local custom_attach, updated_capabilities, root_dir = require('utils').lsp_setup()

require('lspconfig').tsserver.setup {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact' },
  capabilities = updated_capabilities,
  root_dir = root_dir,
  on_attach = custom_on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
