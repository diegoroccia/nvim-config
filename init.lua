-- better to set this up first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- helper functions to use across the config

---Helper function to simplify key mapping
---@param keys string string or table of strings
---@param func function|string command or function to call
---@param desc string description of the mapping
_G.map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = 0, desc = "LSP: " .. desc })
end

require("config.options")
require("config.lazy")
require("config.lsp")
require("config.diagnostics")
require("config.keymaps")
require("config.autocommands")
require("config.zalando").setup({})
