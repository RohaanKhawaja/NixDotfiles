-- Fuzzy finder
local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
      preview_width = 0.55,
    },
  },
  pickers = {
    find_files = {
      hidden = true,         -- show dotfiles
    },
    live_grep = {
      additional_args = { "--hidden" },  -- grep dotfiles too
    },
  },
})

-- File finding
vim.keymap.set('n', '<Leader>ff', builtin.find_files,              { desc = "Find files" })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep,               { desc = "Live grep" })
vim.keymap.set('n', '<Leader>fr', builtin.oldfiles,                { desc = "Recent files" })
vim.keymap.set('n', '<Leader>fb', builtin.buffers,                 { desc = "Find buffers" })
vim.keymap.set('n', '<Leader>f/', builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })

-- Git
vim.keymap.set('n', '<Leader>gf', builtin.git_files,              { desc = "Git files" })
vim.keymap.set('n', '<Leader>gc', builtin.git_commits,            { desc = "Git commits" })
vim.keymap.set('n', '<Leader>gb', builtin.git_branches,           { desc = "Git branches" })
vim.keymap.set('n', '<Leader>gs', builtin.git_status,             { desc = "Git status" })

-- LSP
vim.keymap.set('n', '<Leader>lr', builtin.lsp_references,         { desc = "LSP references" })
vim.keymap.set('n', '<Leader>ld', builtin.lsp_definitions,        { desc = "LSP definitions" })
vim.keymap.set('n', '<Leader>ls', builtin.lsp_document_symbols,   { desc = "Document symbols" })
vim.keymap.set('n', '<Leader>lw', builtin.lsp_workspace_symbols,  { desc = "Workspace symbols" })
vim.keymap.set('n', '<Leader>le', builtin.diagnostics,            { desc = "Diagnostics" })

-- Vim
vim.keymap.set('n', '<Leader>fk', builtin.keymaps,                { desc = "Keymaps" })
vim.keymap.set('n', '<Leader>fh', builtin.help_tags,              { desc = "Help tags" })
vim.keymap.set('n', '<Leader>fc', builtin.commands,               { desc = "Commands" })

-- Git signs in the gutter
require("gitsigns").setup()


-- Treesitter
local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  configs.setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "latex" },
    },
    indent = {
      enable = true,
    },
  })
end

-- Treesitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
