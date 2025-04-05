-- better to set this up first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- helper functions to use across the config

-- Sets a keymap
--@param keys: string or table of strings
--@param func: function to call
--@param desc: string description of the mapping
_G.map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = 0, desc = "LSP: " .. desc })
end

require("config.options")
require("config.lazy")
require("config.lsp")
