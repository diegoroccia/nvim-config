return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                term_colors = true,
                dim_inactive = {
                    enabled = true,
                },
                integrations = {
                    alpha = true,
                    cmp = true,
                    gitsigns = true,
                    lsp_saga = true,
                    lsp_trouble = true,
                    markdown = true,
                    mason = true,
                    mini = true,
                    noice = true,
                    notify = true,
                    treesitter = true,
                    treesitter_context = true,
                    which_key = true,
                    snacks = {
                        enabled = true,
                        indent_scope_color = "mocha", -- catppuccin color (eg. `lavender`) Default: text
                    },
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
