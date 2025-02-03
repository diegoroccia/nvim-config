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
                    dark = "macchiato",
                },
                transparent_background = true,
                term_colors = true,
                dim_inactive = {
                    enabled = true,
                },
                integrations = {
                    alpha = true,
                    cmp = true,
                    dashboard = true,
                    gitsigns = true,
                    lsp_saga = true,
                    lsp_trouble = true,
                    markdown = true,
                    mason = true,
                    mini = true,
                    nvimtree = true,
                    noice = true,
                    notify = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                    vimwiki = true,
                    which_key = true,
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
