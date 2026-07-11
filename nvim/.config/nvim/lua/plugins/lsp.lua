-- Diagnostic signs
vim.diagnostic.config({
  virtual_text = true,           -- show errors inline
  signs = true,                  -- show signs in gutter
  underline = true,              -- underline problematic code
  update_in_insert = false,      -- don't update diagnostics in insert mode
  severity_sort = true,          -- sort by severity
  float = {
    border = "rounded",
    source = true,               -- show which LSP reported the error
  },
})

-- Keybinds (only active when LSP attaches to buffer)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, noremap = true }

    vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,      vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,     vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,  vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    vim.keymap.set('n', 'gr',         vim.lsp.buf.references,      vim.tbl_extend("force", opts, { desc = "Go to references" }))
    vim.keymap.set('n', 'K',          vim.lsp.buf.hover,           vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename,          vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action,     vim.tbl_extend("force", opts, { desc = "Code action" }))
    vim.keymap.set('n', '<Leader>f',  vim.lsp.buf.format,          vim.tbl_extend("force", opts, { desc = "Format buffer" }))
    vim.keymap.set('n', '[d',         vim.diagnostic.goto_prev,    vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
    vim.keymap.set('n', ']d',         vim.diagnostic.goto_next,    vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
  end,
})

-- LSP servers
local servers = {
  "clangd",          -- C/C++
  "pyright",         -- Python
  "texlab",          -- LaTeX
  "zls",             -- Zig
  "jdtls",           -- Java
  "marksman",        -- Markdown
  "bashls",          -- Bash
  "nixd",            -- Nix
  "jsonls",          -- JSON
  "yamlls",          -- YAML
  "taplo",           -- TOML
  "cmake",           -- CMake
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
  vim.lsp.enable(server)
end

-- Lua LSP (configured separately since it needs specific settings)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "hl" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})
vim.lsp.enable('lua_ls')
