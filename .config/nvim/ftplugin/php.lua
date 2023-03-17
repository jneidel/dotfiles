-- php lsp
-- https://phpactor.readthedocs.io/en/master/usage/standalone.html#global-installation

local custom_attach, updated_capabilities, root_dir = require('utils').lsp_setup()

require('lspconfig').phpactor.setup{
  cmd = { "phpactor", "language-server" },
  filetypes = { "php" },
  capabilities = updated_capabilities,
  root_dir = root_dir,
  on_attach = custom_on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
