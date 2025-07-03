return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				term_colors = false,
				dim_inactive = {
					enabled = false,
				},
				integrations = {
					blink_cmp = true,
					gitsigns = true,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					mini = {
						enabled = true,
					},
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
