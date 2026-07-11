-- Rohaan's NixOS Nvim Config - vim.opt options

local options = {
  -- Basic Settings
  cursorline = true,	      -- Highlights current line
  number = true,		      -- Line numbers
  relativenumber = true,   -- Relative Line numbers
  wrap = true,		         -- Wrap lines
  breakindent = true,      -- Match indentation for linebreaks
  linebreak = true,        -- Don't wrap words
  showbreak = "↪ ",	      -- Show symbol for line breaks
  scrolloff = 11, 		   -- Keep 10 lines above/below cursor
  sidescrolloff = 8, 	   -- Keep 8 columns left/right of cursor

  -- Indentation
  tabstop = 2, 		      -- Tab width
  shiftwidth = 2,		      -- Indent width
  softtabstop = 2, 	      -- Soft tab stop
  expandtab = true, 	      -- Use spaces instead of tabs
  smartindent = true,      -- Smart auto-indentation

  -- Search settings
  ignorecase = true,       -- Case insensitive search
  smartcase = true,	      -- Case sensitive iff uppercase in search
  hlsearch = false, 	      -- Don't highlight search results
  incsearch = true,	      -- Show matches as you type

  -- Appearance
  termguicolors = true,    -- Enable 24-bit colours
  signcolumn = "yes",      -- Always show sign column

  -- Behaviour
  splitbelow = true,       -- Horizontal splits open below
  splitright = true,       -- Vertical splits open to the right
  swapfile = false,        -- No swap files
  undofile = true,         -- Persistent undo history
  hidden = true,           -- Allow hidden buffers
  errorbells = false,      -- No error bells
  autochdir = false,       -- Don't auto change directory
  selection = "exclusive", -- Selection behaviour
  mouse = "a",             -- Enable mouse support
  modifiable = true,       -- Allow buffer modifications

  -- Visual
  showmatch = true,        -- Highlight matching brackets
  matchtime = 3,           -- How long to show matching brackets
  cmdheight = 2,           -- Command line height
  showmode = false,        -- Don't show mode in command line
  pumheight = 11,          -- Popup menu height
  pumblend = 11,           -- Popup menu transparency
  winblend = 1,            -- Floating window transparency
  conceallevel = 1,        -- Don't hide  markup
  concealcursor = "",      -- Don't hide cursor line markup
  synmaxcol = 301,         -- Syntax highlighting limit

  -- File handling
  backup = false,          -- Don't create backup files
  writebackup = false,     -- Don't create backup before writing
  updatetime = 301,        -- Faster completion
  autoread = true,         -- Auto reload files changed outside vim
  autowrite = false,       -- Don't autosave

}

-- Prefixes all above options with vim.opt automatically
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Special Options
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")   -- Undo directory
vim.opt.completeopt = "menuone,noinsert,noselect"   -- Completion options
vim.opt.backspace = "indent,eol,start"              -- Better backspace behaviour
vim.opt.path:append("**")                           -- Include subdirectories in search

-- Netrw (file manager) options
vim.g.netrw_banner = 0                              -- Hide the top banner
vim.g.netrw_liststyle = 3                           -- Tree-style view
vim.g.netrw_winsize = 25                            -- Width of netrw split (percentage)

-- Cursor Settings (solid block = normal, solid line = visual, blinking line = insert)
vim.o.guicursor = table.concat({
  "n:block",                                        -- Normal mode: solid block
  "v:ver26",                                        -- Visual mode: solid thin vertical bar (25%)
  "i:ver26-blinkwait300-blinkon200-blinkoff150",    -- Insert mode: blinking thin vertical bar
  "c:ver26",                                        -- Command-line mode: thin vertical bar
  "r:hor21",                                        -- Replace mode: horizontal bar
}, ",")

-- Clipboard Settings
vim.opt.clipboard = "unnamedplus"
if vim.env.XDG_CURRENT_DESKTOP ~= "KDE" then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = { "wl-copy", "--foreground", "--type", "text/plain" },
      ["*"] = { "wl-copy", "--foreground", "--type", "text/plain" },
    },
    paste = {
      ["+"] = { "wl-paste", "--no-newline" },
      ["*"] = { "wl-paste", "--no-newline" },
    },
    cache_enabled = 1,
  }
end
