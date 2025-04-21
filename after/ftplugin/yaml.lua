vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.api.nvim_set_hl(0, "@account_id.yaml", { link = "Error" })
vim.api.nvim_set_hl(0, "@values.yaml", { link = "Identifier" })
