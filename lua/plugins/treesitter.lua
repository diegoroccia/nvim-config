return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "cue", "python", "lua", "go", "yaml", "typescript", "javascript", "css", "markdown"
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn", -- set to `false` to disable one of the mappings
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        },

        ---@param opts TSConfig
        config = function(_, opts)
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            require("nvim-treesitter.configs").setup(opts)
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
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
