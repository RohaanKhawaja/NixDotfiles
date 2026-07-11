--vim.g.vimtex_view_method = 'tdf'           -- Use TDF inside Kitty
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'tmux'
vim.g.vimtex_view_general_options = 'split-window -h tdf @pdf'
vim.g.vimtex_quickfix_mode = 0             -- Only show quickfix on errors
vim.g.vimtex_compiler_method = 'latexmk'   -- Default compiler
vim.g.vimtex_quickfix_open_on_warning = 0

vim.g.vimtex_compiler_latexmk = {
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  options = {
    '-pdf',
    '-interaction=nonstopmode',
    '-synctex=1',
  },
  build_dir = '',
  hooks = {},
  quiet = 1,
  autoclose = 1,
}
