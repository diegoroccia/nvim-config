local M = {
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     event = "VeryLazy",
    --     opts = {}
    -- },
    {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            "echasnovski/mini.pick",  -- optional
        },
        config = true
    }
}

return M
