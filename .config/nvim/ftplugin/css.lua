-- installation: sudo npm i -g vscode-langservers-extracted

require('lspconfig').cssls.setup {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'sass', 'scss' },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    sass = { validate = true },
  },
  capabilities = updated_capabilities,
  root_dir = root_dir,
  on_attach = custom_on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
