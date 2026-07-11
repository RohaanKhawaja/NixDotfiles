require("nvim-autopairs").setup({
  check_ts = true,  -- use treesitter to check for matching pairs
})

-- Auto-close brackets after function/snippet completion via cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
