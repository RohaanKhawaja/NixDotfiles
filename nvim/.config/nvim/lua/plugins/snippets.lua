local ls = require("luasnip")

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

-- Load custom TeX snippets
require("snippets.tex")
