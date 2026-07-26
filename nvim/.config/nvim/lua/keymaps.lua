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
  { 'n', '<Esc>',      ':nohlsearch<CR>',                                  { desc = "Clear search highlight" } },

  -- Keep cursor centred when scrolling
  { 'n', '<C-d>',      '<C-d>zz',                                          { desc = "Scroll down (centred)" } },
  { 'n', '<C-u>',      '<C-u>zz',                                          { desc = "Scroll up (centred)" } },

  -- Keep cursor centred when jumping between search results
  { 'n', 'n',          'nzzzv',                                            { desc = "Next search result (centred)" } },
  { 'n', 'N',          'Nzzzv',                                            { desc = "Prev search result (centred)" } },

  -- Better window navigation
  { 'n', '<C-h>',      '<C-w>h',                                           { desc = "Move to left window" } },
  { 'n', '<C-j>',      '<C-w>j',                                           { desc = "Move to window below" } },
  { 'n', '<C-k>',      '<C-w>k',                                           { desc = "Move to window above" } },
  { 'n', '<C-l>',      '<C-w>l',                                           { desc = "Move to right window" } },

  -- Better indenting in visual mode (stay in visual mode after indent)
  { 'v', '<',          '<gv',                                              { desc = "Indent left (stay in visual)" } },
  { 'v', '>',          '>gv',                                              { desc = "Indent right (stay in visual)" } },

  -- Move lines up/down in visual mode
  { 'v', 'J',          ":m '>+1<CR>gv=gv",                                { desc = "Move selection down" } },
  { 'v', 'K',          ":m '<-2<CR>gv=gv",                                { desc = "Move selection up" } },

  -- Delete without yanking by default
  { 'n', 'd',          '"_d',                                              { desc = "Delete (no yank)" } },
  { 'n', 'D',          '"_D',                                              { desc = "Delete to EOL (no yank)" } },
  { 'x', 'd',          '"_d',                                              { desc = "Delete (no yank)" } },

  -- Change without yanking by default
  { 'n', 'c',          '"_c',                                              { desc = "Change (no yank)" } },
  { 'n', 'C',          '"_C',                                              { desc = "Change to EOL (no yank)" } },
  { 'x', 'c',          '"_c',                                              { desc = "Change (no yank)" } },

  -- Leader + delete = normal delete (yanks)
  { 'n', '<Leader>d',  'd',                                                { desc = "Delete (yank)" } },
  { 'n', '<Leader>D',  'D',                                                { desc = "Delete to EOL (yank)" } },
  { 'x', '<Leader>d',  'd',                                                { desc = "Delete (yank)" } },

  -- Leader + change = normal change (yanks)
  { 'n', '<Leader>c',  'c',                                                { desc = "Change (yank)" } },
  { 'n', '<Leader>C',  'C',                                                { desc = "Change to EOL (yank)" } },
  { 'x', '<Leader>c',  'c',                                                { desc = "Change (yank)" } },

  -- Paste over selection without losing yanked text
  { 'x', 'p',          '"_dP',                                             { desc = "Paste over selection (no yank)" } },

  -- Replace word(s) under cursor
  { 'n', '<Leader>rw', '"_cw',                                             { desc = "Replace word under cursor" } },
  { 'n', '<Leader>rl', '"_C',                                              { desc = "Replace to end of line" } },

  -- Find and replace (current word under cursor)
  { 'n', '<Leader>R',  ':%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>', { desc = "Find and replace word under cursor" } },

  -- Save file
  { 'n', '<Leader>w',  ':w<CR>',                                           { desc = "Save file" } },

  -- Quit / Force quit
  { 'n', '<Leader>q',  ':q<CR>',                                           { desc = "Quit" } },
  { 'n', '<Leader>Q',  ':q!<CR>',                                          { desc = "Force quit" } },

  -- File manager (netrw)
  { 'n', '<Leader>e',  ':Ex<CR>',                                          { desc = "Open netrw" } },
  { 'n', '<Leader>pv', ':Vex<CR>',                                         { desc = "Open netrw (vertical split)" } },

  -- Normal mode command
  { 'n', '<Leader>:',  ':norm ',                                           { desc = "Run normal mode command" } },
}

for _, k in ipairs(keymaps) do
  map(k[1], k[2], k[3], k[4])
end

-- Replace X instances of word under cursor
vim.keymap.set("n", "<Leader>rc", function()
  local count = vim.v.count1
  local word = vim.fn.expand("<cword>")
  local replacement = vim.fn.input("Replace " .. count .. " instances of '" .. word .. "' with: ")
  if replacement == "" then return end

  local replaced = 0
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local cursor_line = vim.fn.line(".") - 1
  local cursor_col = vim.fn.col(".")

  for i, line in ipairs(lines) do
    if replaced >= count then break end
    local new_line = line:gsub(vim.pesc(word), function()
      if replaced >= count then return word end
      -- on cursor line, only match from cursor position onwards for first replacement
      replaced = replaced + 1
      return replacement
    end)
    lines[i] = new_line
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.notify("Replaced " .. replaced .. " instance(s) of '" .. word .. "'")
end, { desc = "Replace n instances of word under cursor" })

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

vim.keymap.set("n", "gF",         tmux_open({ "split-window", "-v" }), { desc = "Open file under cursor in tmux split" })
vim.keymap.set("n", "<Leader>gn", tmux_open({ "new-window" }),         { desc = "Open file under cursor in tmux window" })
