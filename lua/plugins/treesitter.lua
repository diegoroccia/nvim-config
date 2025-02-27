return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            -- "diegoroccia/zalando.nvim",
            {
                "romgrk/nvim-treesitter-context",
                event = "BufRead",
                dependencies = { "nvim-treesitter" },
                config = function()
                    require("treesitter-context").setup({
                        enable = true,
                        throttle = true,
                    })
                end,
            },
            {
                "vrischmann/tree-sitter-templ",
                config = function()
                    require("tree-sitter-templ").setup({})
                end,
                ft = "templ",
            },
        },
    },
}
