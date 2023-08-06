local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.clipboard = "unnamedplus"
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4

autocmd("FileType", {
  pattern = {'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript'},
  callback = function()
    opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

autocmd("FileType", {
  pattern = {"markdown"},
  callback = function()
    opt.expandtab = true
    vim.opt.shiftwidth = 3
    vim.opt.tabstop = 3
  end,
})

autocmd("FileType", {
  pattern = {"go", "golang"},
  callback = function()
    vim.opt.expandtab = false
  end,
})
