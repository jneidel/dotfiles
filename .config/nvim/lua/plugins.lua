local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup( {
  -- basics
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = true
  },
  "chrisbra/improvedft", -- better f and t

  -- status bar theme
  "itchyny/lightline.vim",

  -- lsp
  "neovim/nvim-lspconfig", -- lsp
  -- "glepnir/lspsaga.nvim", -- nicer lsp UI
  {
    "neoclide/coc.nvim",
    branch="release"
  },

  -- autocomplete
  { "hrsh7th/nvim-cmp", -- completion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip"
    }
  },

  -- syntax highlighting
  "nvim-treesitter/nvim-treesitter", -- dynamic syntax highlighting independant of lang

  -- language specific
  {
    "preservim/vim-markdown",
    ft = "markdown",
  },
  {
    "brenoprata10/nvim-highlight-colors", -- visualize hex color codes
    ft = { "css", "scss", "sass", "html", },
    config = function()
      vim.opt.termguicolors = true -- is required for color highlighting, but breaks italics
      -- TODO: find a way to turn this off outside of these ft

      require("nvim-highlight-colors").setup({
        render = 'background',
        enable_named_colors = true,
      })
    end
  },

  -- file explorer
  "lambdalisue/fern-hijack.vim",
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/fern-git-status.vim",
      "yuki-yano/fern-preview.vim" -- preview
    },
    cmd = "Fern",
  },

  -- file finder
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make'
      },
      "nvim-lua/plenary.nvim"
    },
    lazy = true,
    cmd = "Telescope"
  },
  {
    'junegunn/fzf.vim',
    dependencies = {
      'junegunn/fzf',
    },
  },

  -- other
  "windwp/nvim-autopairs", -- create closing pairs
  "numToStr/Comment.nvim", -- comments
  {
    "andrewferrier/debugprint.nvim", -- create uniform & unique print statements
    lazy = true,
    config = function()
      require("debugprint").setup({ create_keymaps = false })
    end
  },
  {
    "nvim-neorg/neorg", -- org mode
    build = ":Neorg sync-parsers",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufEnter *.norg",
    cmd = "Neorg",
  },
} )

-- snippets:
--  https://github.com/neoclide/coc-snippets
--  vsnip, luasnip, snippy, ultisnips
--  see for cmp changes: https://github.com/hrsh7th/nvim-cmp#recommended-configuration

-- formatting:
--  coc-extension: coc-diagnostic for linting and formatting
--    https://github.com/iamcco/coc-diagnostic https://github.com/iamcco/diagnostic-languageserver
--  https://github.com/fannheyward/coc-rome
--  https://github.com/neoclide/coc-prettier https://github.com/prettier/prettier-vscode

-- dir/file management
--  https://github.com/stevearc/oil.nvim

-- AI helper
--  https://github.com/Exafunction/codeium.vim
