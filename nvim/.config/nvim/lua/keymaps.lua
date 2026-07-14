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


local function resolve_cfile()
  local raw = vim.fn.expand("<cfile>")
  local name = raw

  -- apply the buffer's includeexpr (e.g. dots → slashes for lua modules)
  local iexpr = vim.bo.includeexpr
  if iexpr ~= "" then
    local expr = iexpr:gsub("v:fname", vim.fn.string(raw))
    local ok, res = pcall(vim.fn.eval, expr)
    if ok and res ~= nil and res ~= "" then
      name = res
    end
  end

  -- search 'path' respecting 'suffixesadd', like gf does
  local found = vim.fn.findfile(name, vim.bo.path)
  if found == "" then
    found = vim.fn.findfile(raw, vim.bo.path)
  end
  return found ~= "" and vim.fn.fnamemodify(found, ":p") or nil
end

local function tmux_open(args)
  return function()
    if not vim.env.TMUX then
      vim.cmd("normal! " .. (args[1] == "new-window" and "gF" or "gf"))
      return
    end
    local file = resolve_cfile()
    if not file then
      vim.notify("File not found: " .. vim.fn.expand("<cfile>"), vim.log.levels.WARN)
      return
    end
    local cmd = { "tmux" }
    vim.list_extend(cmd, args)
    vim.list_extend(cmd, { "nvim " .. vim.fn.shellescape(file) })
    vim.fn.system(cmd)
  end
end

vim.keymap.set("n", "gf", tmux_open({ "split-window", "-v" }))
vim.keymap.set("n", "gF", tmux_open({ "new-window" }))
