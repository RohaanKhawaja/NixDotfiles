require("colorizer").setup({
  filetypes = { "*" },   -- enable for all filetypes
  user_default_options = {
    RGB      = true,     -- #RGB
    RRGGBB   = true,     -- #RRGGBB
    names    = false,    -- don't highlight colour names like "red"
    css      = true,     -- enable all CSS features
    mode     = "background",  -- highlight the background of the hex code
  },
})
