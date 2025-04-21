return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "python", "lua", "go", "typescript", "javascript", "css",
                "cue", "kcl", "rego",
                "markdown", "yaml",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },

            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                },

                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]z"] = { query = "@account_id", query_group = "highlights" }
                    },
                    goto_previous_start = {
                        ["[z"] = { query = "@account_id", query_group = "highlights" }
                    },
                },

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
