-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'html', 'css', 'scss', 'javascript', 'typescript', 'tsx', 'json', 'lua', 'bash', 'regex', 'comment' },
  ignore_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  autopairs = { enable = true },
}
