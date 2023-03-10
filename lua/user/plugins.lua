local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("ERROR: Something happened with packer. Packer will not load")
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

-- Install your plugins here --
return packer.startup(function(use)
        -- My plugins here --
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-tree/nvim-web-devicons" -- optional, for icons
  use "lewis6991/impatient.nvim"

-- Colorschemes
  use 'folke/tokyonight.nvim'

-- Autocompletion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

-- Snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

-- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer    
  use "jose-elias-alvarez/null-ls.nvim"

-- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'

-- Treesitter
   use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
   use "p00f/nvim-ts-rainbow"

-- Autopairs: () {} []
   use "windwp/nvim-autopairs"

-- Commenter
   use "numToStr/Comment.nvim" -- Easily comment stuff
   use 'JoosepAlviste/nvim-ts-context-commentstring'

-- NvimTree: File explorer for neovim
   use 'nvim-tree/nvim-tree.lua'

-- Bufferline: See buffers with style
   use 'akinsho/bufferline.nvim'
   use 'moll/vim-bbye' -- Better buffer closing
   use 'nvim-lualine/lualine.nvim' -- Statusline

-- Dashboard
   use 'goolord/alpha-nvim'

-- Terminal inside neovim
   use 'akinsho/toggleterm.nvim'

-- Project management
  use 'ahmedkhalf/project.nvim'

-- Which Key
  use 'folke/which-key.nvim'

-- Trouble
  use "folke/trouble.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
