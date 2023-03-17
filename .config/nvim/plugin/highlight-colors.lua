local hasmodule, highlightcolors = pcall( require, "nvim-highlight-colors" )

if hasmodule then
  vim.api.nvim_command( "set termguicolors" ) -- uses the gui version of the colorscheme

  highlightcolors.setup {
    render = 'background',
    enable_named_colors = true,
  }
end
