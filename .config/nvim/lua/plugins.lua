-- Intall packages with ':PackerSync'

return require('packer').startup(function(use)
  -- basics
  use "wbthomason/packer.nvim" -- package manager itself
  use "christoomey/vim-tmux-navigator" -- move between tmux and vim
  use "chrisbra/improvedft" -- better f and t

  -- theme
  use "itchyny/lightline.vim"

  -- lsp
  use "neovim/nvim-lspconfig" -- lsp
  -- "glepnir/lspsaga.nvim", -- nicer lsp UI
  use { "neoclide/coc.nvim", branch="release" }

  -- autocomplete
  use { "hrsh7th/nvim-cmp", -- completion engine
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip"
    }
  }

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter" -- dynamic syntax highlighting independant of lang

  -- language specific
  use "preservim/vim-markdown"

  -- file explorer
  use "lambdalisue/fern-hijack.vim"
  use {
    "lambdalisue/fern.vim",
    cmd = { "Fern"},  -- lazy load
    requires = {
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/fern-git-status.vim",
      "yuki-yano/fern-preview.vim" -- preview
    }
  }

  -- file finder
  use { "nvim-telescope/telescope.nvim", branch = '0.1.x', requires = {"nvim-lua/plenary.nvim"} }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make' }

  -- other
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim" -- comments
  -- "justinmk/vim-dirvish",
  -- "brenoprata10/nvim-highlight-colors", -- visualize hex color codes
end)

-- snippets:
--  https://github.com/neoclide/coc-snippets
--  vsnip, luasnip, snippy, ultisnips
--  see for cmp changes: https://github.com/hrsh7th/nvim-cmp#recommended-configuration

-- formatting:
--  coc-extension: coc-diagnostic for linting and formatting
--    https://github.com/iamcco/coc-diagnostic https://github.com/iamcco/diagnostic-languageserver
--  https://github.com/fannheyward/coc-rome
--  https://github.com/neoclide/coc-prettier https://github.com/prettier/prettier-vscode
