local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins

  -- nightfox colorscheme
  use "EdenEast/nightfox.nvim"
  
  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  use {'ZhiyuanLck/smart-pairs', event="InsertEnter", config=function() require('pairs'):setup() end}


  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {"rcarriga/vim-ultest",
        requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins"}

  use {"nvim-telescope/telescope.nvim",
    requires = {
        "nvim-telescope/telescope-media-files.nvim",
    }
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

  use "terrortylor/nvim-comment"
  require('nvim_comment').setup()
end)
