local M = {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {}
    },
    {
        "NeogitOrg/neogit",
        -- event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "echasnovski/mini.pick",  -- optional
        },
        cmd = "Neogit",
        keys = {
            {
                "<leader>gc",
                function()
                    require('neogit').open({ kind = "vsplit" })
                end,
                desc = "commit"
            },
            {
                "<leader>gp",
                function()
                    require('neogit').open({ "push", kind = "vsplit" })
                end,
                desc = "commit"
            },
        },
        opts = {
            kind = "vsplit",
            commit_editor = {
                kind = "vsplit",
            }
        },
        config = true,
    }
}

return M
