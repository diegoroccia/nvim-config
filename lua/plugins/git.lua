local M = {
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'folke/snacks.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "octo".setup(
                {
                    picker = "snacks",
                    default_to_projects_v2 = true,
                    ssh_aliases = {
                        ["github-zcn"] = "github.com",
                        ["github-zse"] = "github.com"
                    },
                }
            )
        end
    },
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
            "echasnovski/mini.nvim",  -- optional
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
