-- Rohaan's NixOS Nvim Config - keymaps

local map = function(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  vim.keymap.set(modes, lhs, rhs, opts)
end

-- Set leader key to SPACE
vim.g.mapleader = ' '

local keymaps = {
  -- Clear search highlight
  { 'n', '<Esc>',    ':nohlsearch<CR>' },

  -- Keep cursor centred when scrolling
  { 'n', '<C-d>',    '<C-d>zz' },
  { 'n', '<C-u>',    '<C-u>zz' },

  -- Keep cursor centred when jumping between search results
  { 'n', 'n',        'nzzzv' },
  { 'n', 'N',        'Nzzzv' },

  -- Better window navigation
  { 'n', '<C-h>',    '<C-w>h' },
  { 'n', '<C-j>',    '<C-w>j' },
  { 'n', '<C-k>',    '<C-w>k' },
  { 'n', '<C-l>',    '<C-w>l' },

  -- Better indenting in visual mode (stay in visual mode after indent)
  { 'v', '<',        '<gv' },
  { 'v', '>',        '>gv' },

  -- Move lines up/down in visual mode
  { 'v', 'J',        ":m '>+1<CR>gv=gv" },
  { 'v', 'K',        ":m '<-2<CR>gv=gv" },

  -- Delete without yanking by default
  { 'n', 'd',        '"_d' },
  { 'n', 'D',        '"_D' },
  { 'x', 'd',        '"_d' },

  -- Change without yanking by default
  { 'n', 'c',        '"_c' },
  { 'n', 'C',        '"_C' },
  { 'x', 'c',        '"_c' },

  -- Leader + delete = normal delete (yanks)
  { 'n', '<Leader>d', 'd' },
  { 'n', '<Leader>D', 'D' },
  { 'x', '<Leader>d', 'd' },

  -- Leader + change = normal change (yanks)
  { 'n', '<Leader>c', 'c' },
  { 'n', '<Leader>C', 'C' },
  { 'x', '<Leader>c', 'c' },

  -- Find and replace (current word under cursor)
  { 'n', '<Leader>r', ':%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>' },

  -- Save file
  { 'n', '<Leader>w', ':w<CR>' },

  -- Quit / Force quit
  { 'n', '<Leader>q', ':q<CR>' },
  { 'n', '<Leader>Q', ':q!<CR>' },

  -- File manager (netrw)
  { 'n', '<Leader>e',  ':Ex<CR>' },   -- Open netrw in current window
  { 'n', '<Leader>pv', ':Vex<CR>' },  -- Open netrw in vertical split
}

for _, k in ipairs(keymaps) do
  map(k[1], k[2], k[3])
end
