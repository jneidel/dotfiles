-- highlight colors

vim.api.nvim_command( "set termguicolors" ) -- uses the gui version of the colorscheme

require('nvim-highlight-colors').setup {
  render = 'background',
  enable_named_colors = true,
}
