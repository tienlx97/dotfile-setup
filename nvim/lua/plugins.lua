local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" },
  })

  -- use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use("szw/vim-maximizer") -- maximizes and restores current window

  -- commenting with gc
  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    }
  })
  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  use("nvim-tree/nvim-web-devicons") -- File icons

  -- statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig") -- LSP

  -- configuring lsp servers

  use("nvim-lua/plenary.nvim")     -- Common utilities
  use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client

  use("hrsh7th/cmp-nvim-lsp")      -- nvim-cmp source for neovim's built-in LSP
  use({
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    commit = "b7b4777",
  })
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind-nvim")               -- vscode-like pictograms

  use("jose-elias-alvarez/null-ls.nvim")    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use("jayp0521/mason-null-ls.nvim")        -- bridges gap b/w mason & null-ls

  -- autocompletion
  use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
  use("hrsh7th/nvim-cmp")   -- Completion
  use("hrsh7th/cmp-path")   -- source for file system paths

  use("L3MON4D3/LuaSnip")

  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("norcalli/nvim-colorizer.lua")
  use("folke/zen-mode.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("akinsho/nvim-bufferline.lua")
  -- use 'github/copilot.vim'

  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")
  -- use 'dinhhuy258/git.nvim' -- For git blame & browse

  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })
end)
