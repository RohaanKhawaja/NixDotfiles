-- Statusline
require("lualine").setup({
  options = {
    theme = "dracula",
  },
})

-- Indentation guides
require("ibl").setup({
  indent = { char = "│" },
  scope = { enabled = true },
})

-- Keybinding hints
require("which-key").setup({})

-- Notifications
local notifyOk, notify = pcall(require, "notify")
if notifyOk then
  notify.setup({
    background_colour = "#000000",
    stages = "fade",
    timeout = 3000,
  })
  vim.notify = notify
end

-- Command line, messages, popup menu UI
require("noice").setup({
  cmdline = {
    view = "cmdline_popup",
  },
  messages = {
    enabled = true,
  },
  popupmenu = {
    enabled = true,
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
})
