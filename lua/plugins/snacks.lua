return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = require('config.snacks'),
        keys = {
            -- Top Pickers & Explorer
            { "<leader><space>", function() Snacks.picker.smart() end,                             desc = "Smart Find Files" },
            { "<leader>,",       function() Snacks.picker.buffers() end,                           desc = "Buffers" },
            { "<leader>/",       function() Snacks.picker.grep() end,                              desc = "Grep" },
            { "<leader>:",       function() Snacks.picker.command_history() end,                   desc = "Command History" },
            { "<leader>n",       function() Snacks.picker.notifications() end,                     desc = "Notification History" },
            { "<leader>f",       function() Snacks.explorer({ cwd = vim.fs.root(0, '.git') }) end, desc = "File Explorer" },

            { "<C-e>",           function() Snacks.picker.icons() end,                             desc = "Emoji Explorer",      mode = { "i" }, },
        }
    },
}
