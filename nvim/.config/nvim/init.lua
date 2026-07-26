-- Rohaan's Nvim Config - Master init.lua file
-- Please note that on NixOS with nixcats, the OS will need to be rebuilt

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
--   -- Theme
--   "dracula/vim",
--
--   -- UI
--   "nvim-lualine/lualine.nvim",
--   "nvim-tree/nvim-web-devicons",
--   "lukas-reineke/indent-blankline.nvim",
--   "folke/which-key.nvim",
--   "rcarriga/nvim-notify",
--   "folke/noice.nvim",
--   "MunifTanjim/nui.nvim",
--   "nvim-tree/nvim-tree.lua",
--   "norcalli/nvim-colorizer.lua",
--
--   -- Editor
--   "nvim-telescope/telescope.nvim",
--   "nvim-lua/plenary.nvim",
--   "lewis6991/gitsigns.nvim",
--   "nvim-treesitter/nvim-treesitter",
--
--   -- LSP
--   "neovim/nvim-lspconfig",
--
--   -- Completion
--   "hrsh7th/nvim-cmp",
--   "hrsh7th/cmp-nvim-lsp",
--   "hrsh7th/cmp-buffer",
--   "hrsh7th/cmp-path",
--   "L3MON4D3/LuaSnip",
--   "saadparwaiz1/cmp_luasnip",
--   "windwp/nvim-autopairs",
--
--   -- LaTeX
--   "lervag/vimtex",
--
--   -- KDL
--   "imsnif/kdl.vim",
--
--   -- Orgmode
--   "nvim-orgmode/orgmode",
--   "nvim-orgmode/org-bullets.nvim",
--   "danilshvalov/org-modern.nvim",
--   "nvim-orgmode/telescope-orgmode.nvim",
--   "hamidi-dev/org-super-agenda.nvim",
--   "aaratha/org-cycle-lite.nvim",
--   "michaelb/sniprun",
--   "lukas-reineke/headlines.nvim",
--   "chipsenkbeil/org-roam.nvim",
--   "bitbloxhub/org-notebook.nvim",
--   "CaryWill/org-roam-ui.nvim",
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
require("plugins.orgmode")
