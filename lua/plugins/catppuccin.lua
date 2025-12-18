return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				term_colors = true,
				dim_inactive = { enabled = false },
				-- Minimal styling for performance
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				-- DISABLE ALL INTEGRATIONS for maximum performance
				integrations = {
					-- Only enable absolutely essential ones
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							warnings = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							warnings = { "underline" },
						},
					},
				},
				compile = {
					enabled = true,
				},
			})

			-- Force recompilation for the new minimal config
			require("catppuccin").compile()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
