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

local plugin = {
  comment = require("plugin.comment"),
  telescope = require("plugin.telescope"),
  neorg = require("plugin.neorg"),
  autopairs = require("plugin.autopairs"),
  debugprint = require("plugin.debugprint"),
  fern = require("plugin.fern"),
  lightline = require("plugin.lightline"),
  coc = require("plugin.coc"),
  cmp = require("plugin.cmp"),
  lspconfig = require("plugin.lspconfig"),
  treesitter = require("plugin.treesitter"),
  markdown = require("plugin.markdown"),
  tmuxNavigation = require("plugin.tmux-navigation"),
  improvedft = require("plugin.improvedft"),
  leap = require("plugin.leap"),
  -- <++> = require("plugin.<++>"),
}

-- define fzf command :Files here so it can be lazy loaded
plugin.telescope.defineFzfUserCommands()

require("lazy").setup( {
  -- ## basics
  { -- create closing pairs
    "windwp/nvim-autopairs",
    config = plugin.autopairs.config,
  },
  {
    "numToStr/Comment.nvim",
    keys = plugin.comment.keys,
    config = plugin.comment.config,
  },

  -- ## movement
  {
    "alexghergh/nvim-tmux-navigation",
    keys = plugin.tmuxNavigation.keys,
    config = plugin.tmuxNavigation.config,
  },
  { -- better f and t
    "chrisbra/improvedft",
    keys = plugin.improvedft.keys,
  },
  { -- leap to where you want to go
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    keys = plugin.leap.keys,
    config = plugin.leap.config,
  },

  -- ## lsp
  {
    "neovim/nvim-lspconfig",
    config = plugin.lspconfig.config,
  },
  -- "glepnir/lspsaga.nvim", -- nicer lsp UI
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = plugin.coc.config,
  },

  -- ## autocomplete
  { -- completion engine
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip"
    },
    config = plugin.cmp.config,
  },

  -- ## syntax highlighting
  { -- dynamic syntax highlighting independant of lang
    "nvim-treesitter/nvim-treesitter",
    config = plugin.treesitter.config,
  },

  -- ## language specific
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = plugin.markdown.config,
  },
  { -- treesitters highlighting breaks at '
    "digitaltoad/vim-pug",
    ft = "pug",
  },

  -- ## file explorer
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/fern-git-status.vim",
      "yuki-yano/fern-preview.vim" -- preview
    },
    cmd = "Fern",
    keys = plugin.fern.keys,
    config = plugin.fern.config,
  },

  -- ## file picker
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make'
      },
      "nvim-lua/plenary.nvim",

    },
    cmd = "Telescope",
    config = plugin.telescope.config,
    keys = plugin.telescope.keys,
  },
  {
    'junegunn/fzf.vim',
    dependencies = {
      'junegunn/fzf',
    },
    cmd = "Files",
  },

  -- ## writing
  {
    "junegunn/goyo.vim",
    cmd = "Goyo",
  },
  {
    "junegunn/limelight.vim",
    cmd = "Limelight",
  },
  {
    "preservim/vim-pencil",
    cmd = "HardPencil",
  },

  -- ## org mode
  {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    tag = "v7.0.0",
    ft = "norg",
    cmd = "Neorg",
    config = plugin.neorg.config,
  },

  -- ## other
  { -- status bar theme
    "itchyny/lightline.vim",
    config = plugin.lightline.config,
  },
  { -- create uniform & unique print statements
    "andrewferrier/debugprint.nvim",
    keys = plugin.debugprint.keys,
    config = plugin.debugprint.config,
  },
  {
    "ledger/vim-ledger",
  },
  { -- proper syntax highlighting
    "linuxcaffe/tw-syntax.vim",
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
