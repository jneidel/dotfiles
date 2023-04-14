local hasmodule, highlightcolors = pcall( require, "nvim-highlight-colors" )

if hasmodule then
  vim.opt.termguicolors = false -- is required for color highlighting, but breaks italics

  highlightcolors.setup {
    render = 'background',
    enable_named_colors = true,
  }
end
