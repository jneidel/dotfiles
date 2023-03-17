local hasmodule, treesitter_configs = pcall( require, "nvim-treesitter.configs" )

if hasmodule then
  treesitter_configs.setup {
    ensure_installed = { 'html', 'css', 'scss', 'javascript', 'typescript', 'tsx', 'json', 'lua', 'regex', 'comment' },
    ignore_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
  }
end
