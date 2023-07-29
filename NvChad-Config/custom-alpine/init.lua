-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.expandtab = false
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
