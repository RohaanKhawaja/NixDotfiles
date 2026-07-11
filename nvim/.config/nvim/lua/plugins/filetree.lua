require("nvim-tree").setup({
  sync_root_with_cwd = true,       -- tree root follows vim's cwd
  respect_buf_cwd = true,          -- use buffer's directory as cwd
  update_focused_file = {
    enable = true,
    update_root = true,            -- change root when switching files
  },
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,           -- collapse empty folders
    highlight_git = true,         -- colour files by git status
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
    },
  },
  filters = {
    dotfiles = false,             -- show dotfiles
  },
  git = {
    enable = true,
    ignore = false,               -- show git-ignored files
  },
  actions = {
    open_file = {
      quit_on_open = true,        -- close tree when opening a file
    },
  },
})

-- Toggle file tree
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, desc = "Toggle file tree" })
-- Focus file tree
vim.keymap.set('n', '<Leader>tt', ':NvimTreeFocus<CR>', { noremap = true, desc = "Focus file tree" })
