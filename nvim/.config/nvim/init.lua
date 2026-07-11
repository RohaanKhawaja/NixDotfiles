-- Rohaan's Nvim Config - Master init.lua file

require("options")
require("keymaps")
require("autocmds")

-- -- LazyVim Bootstrap method (not needed on NixOS with nixcats)
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git", "clone", "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- -- Plugin Installation
-- require("lazy").setup({
--   "dracula/vim",
--   "nvim-lualine/lualine.nvim",
--   "nvim-tree/nvim-web-devicons",   -- added (required by lualine, nvim-tree, etc.)
--   "lukas-reineke/indent-blankline.nvim",
--   "folke/which-key.nvim",
--   "rcarriga/nvim-notify",
--   "folke/noice.nvim",
--   "MunifTanjim/nui.nvim",
--   "nvim-tree/nvim-tree.lua",       -- added
--   "nvim-telescope/telescope.nvim",
--   "nvim-lua/plenary.nvim",         -- added (explicit dep for telescope, gitsigns, etc.)
--   "lewis6991/gitsigns.nvim",
--   "nvim-treesitter/nvim-treesitter",
--   "neovim/nvim-lspconfig",
--   "hrsh7th/nvim-cmp",
--   "hrsh7th/cmp-nvim-lsp",
--   "hrsh7th/cmp-buffer",
--   "hrsh7th/cmp-path",
--   "L3MON4D3/LuaSnip",
--   "saadparwaiz1/cmp_luasnip",
--   "windwp/nvim-autopairs",
--   "lervag/vimtex",
-- }, { lazy = false })

require("plugins.theme")
require("plugins.ui")
require("plugins.editor")
require("plugins.lsp")
require("plugins.completion")
require("plugins.autopairs")
require("plugins.snippets")
require("plugins.latex")
require("plugins.filetree")
require("plugins.colouriser")
