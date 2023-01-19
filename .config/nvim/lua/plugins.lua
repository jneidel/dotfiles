require("paq") {
  "savq/paq-nvim", -- package manager itself

  -- lsp
  "neovim/nvim-lspconfig", -- lsp
  "glepnir/lspsaga.nvim", -- nicer lsp UI
  "L3MON4D3/LuaSnip",

  -- autocomplete
  "hrsh7th/nvim-cmp", -- completion engine
  "hrsh7th/cmp-nvim-lsp", -- lsp source for nvim-cmp

  "hrsh7th/cmp-buffer", -- complete from buff
  "hrsh7th/cmp-path", -- complete from path
  "f3fora/cmp-spell", -- complete from spellsuggest

  "nvim-treesitter/nvim-treesitter", -- dynamic syntax highlighting independant of lang

  -- fern
  "lambdalisue/fern.vim", -- file explorer
  "lambdalisue/nerdfont.vim",
  "lambdalisue/fern-renderer-nerdfont.vim",
  "lambdalisue/fern-git-status.vim",
  "lambdalisue/fern-hijack.vim",
  "yuki-yano/fern-preview.vim",
  -- try using fzf LumaKernel/fern-mapping-fzf.vim

  -- fuzzy finder
  { "nvim-telescope/telescope.nvim", branch = '0.1.x' },
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", run = 'make' },

  -- other
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim", -- comments
  "justinmk/vim-dirvish",
  "brenoprata10/nvim-highlight-colors", -- visualize hex color codes
  { 'neoclide/coc.nvim', branch= 'release' },
}
