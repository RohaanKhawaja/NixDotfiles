local Menu = require("org-modern.menu")

-- Core orgmode
require("orgmode").setup({
  org_agenda_files = { "~/org/**/*" },
  org_default_notes_file = "~/org/inbox.org",
  ui = {
    menu = {
      handler = function(data)
        Menu:new():open(data)
      end,
    },
  },
})

-- Aesthetics
require("org-bullets").setup()
require("headlines").setup()

-- Telescope integration
local telescope = require("telescope")
telescope.load_extension("orgmode")
vim.keymap.set("n", "<Leader>of", telescope.extensions.orgmode.search_headings, { desc = "Org: search headings" })
vim.keymap.set("n", "<Leader>or", telescope.extensions.orgmode.refile_heading,  { desc = "Org: refile heading" })

-- Super agenda
require("org-super-agenda").setup()

-- Cycle lite
require("org-cycle-lite").setup()

-- Sniprun
require("sniprun").setup()

-- Org roam
require("org-roam").setup({
  directory = "~/org/roam",
})

-- Org notebook
require("org-notebook").setup({
  notebook_dir = "~/org/notes",
})

-- Pandoc export keymaps (org files only)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    -- Export to HTML and open in browser
    vim.keymap.set("n", "<Leader>eh", function()
      local file = vim.fn.expand("%:p")
      local out = vim.fn.expand("%:p:r") .. ".html"
      vim.fn.system("pandoc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(out))
      vim.fn.system("xdg-open " .. vim.fn.shellescape(out))
      vim.notify("Exported to " .. out)
    end, { desc = "Org: export to HTML" })

    -- Export to PDF
    vim.keymap.set("n", "<Leader>ep", function()
      local file = vim.fn.expand("%:p")
      local out = vim.fn.expand("%:p:r") .. ".pdf"
      vim.fn.system("pandoc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(out))
      vim.fn.system("xdg-open " .. vim.fn.shellescape(out))
      vim.notify("Exported to " .. out)
    end, { desc = "Org: export to PDF" })

    -- Export to Markdown
    vim.keymap.set("n", "<Leader>em", function()
      local file = vim.fn.expand("%:p")
      local out = vim.fn.expand("%:p:r") .. ".md"
      vim.fn.system("pandoc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(out))
      vim.notify("Exported to " .. out)
    end, { desc = "Org: export to Markdown" })
  end,
})

-- -- Org roam UI (not ready yet)
-- require("org-roam-ui").setup({
--   port = 8080,         -- local server port
--   open_on_start = true -- auto open in browser when launched
-- })
--
-- vim.keymap.set("n", "<Leader>ou", ":OrgRoamUI<CR>", { desc = "Org: open roam UI" })
