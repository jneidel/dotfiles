-- latex lsp
-- installation: sudo pacman -S texlab

local root_dir = vim.loop.cwd
local custom_on_attach = require('utils').custom_on_attach

require('lspconfig').texlab.setup {
  cmd = { 'texlab' },
  filetypes = { 'tex' },
  settings = {
    texlab = {
      auxDirectory = '.',
      bibtexFormatter = 'texlab',
      build = {
        args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
        executable = 'latexmk',
        forwardSearchAfter = false,
        onSave = false,
      },
      chktex = { onEdit = false },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = { args = {} },
      latexFormatter = 'latexindent',
      latexindent = { modifyLineBreaks = false },
    },
  },
  root_dir = root_dir,
  on_attach = custom_on_attach,
}

-- vim.api.nvim_cmd({ cmd = 'LspStart' }, {})
vim.cmd("let b:coc_enabled = 0")
vim.cmd("setlocal spell spelllang=en_us,de")
