vim.opt.background = "dark"

-- Set highlight on search
vim.opt.hlsearch = false

vim.opt.relativenumber = true
vim.opt.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience

vim.opt.completeopt = "menuone,noselect"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.colorcolumn = "80,132"

vim.opt.list = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 4

vim.opt.conceallevel = 2

vim.opt.autochdir = true

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 4
vim.opt.foldlevelstart = 6
vim.opt.foldmethod = "expr"
vim.opt.foldminlines = 6

local space = "·"
vim.opt.listchars:append {
    tab = "│ ",
    multispace = space,
    lead = space,
    trail = space,
    nbsp = space
}
