-- Typst: view the compiled PDF in tdf

local function typst_view()
  local src = vim.fn.expand("%:p")
  local pdf = vim.fn.expand("%:p:r") .. ".pdf"

  -- Compile once if tinymist hasn't exported yet
  if vim.fn.filereadable(pdf) == 0 then
    local out = vim.fn.system({ "typst", "compile", src, pdf })
    if vim.v.shell_error ~= 0 then
      vim.notify("typst compile failed:\n" .. out, vim.log.levels.ERROR)
      return
    end
  end

  if vim.env.TMUX then
    vim.fn.system({ "tmux", "split-window", "-h", "-l", "45%", "tdf " .. vim.fn.shellescape(pdf) })
  else
    vim.fn.jobstart({ "kitty", "--title", "tdf", "-e", "tdf", pdf }, { detach = true })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.keymap.set("n", "<Leader>vt", typst_view, { buffer = true, desc = "Typst: view PDF in tdf" })
  end,
})
