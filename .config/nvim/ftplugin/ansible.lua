-- ansible lsp
-- https://phpactor.readthedocs.io/en/master/usage/standalone.html#global-installation

local custom_attach, updated_capabilities, root_dir = require('utils').lsp_setup()

require('lspconfig').ansiblels.setup{
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible" },
  settings = {
    ansible = {
      ansible = {
        path = "ansible"
      },
      ansibleLint = {
        enabled = true,
        path = "ansible-lint"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python"
      }
    }
  },
  single_file_support = true,
  capabilities = updated_capabilities,
  root_dir = root_dir,
  on_attach = custom_on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

vim.api.nvim_cmd({ cmd = 'LspStart' }, {})
