return {
  config = function()
    local treesitter_configs = require("nvim-treesitter.configs")

    treesitter_configs.setup {
      -- manual install with ":TSInstall LANG"
      ensure_installed = {
        "html",
        "css", "scss",
        "javascript", "typescript", "tsx",
        "json",
        "lua",
        "regex",
        "comment",
        "twig",
        "php",
      },
      ignore_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
    }
  end
}
