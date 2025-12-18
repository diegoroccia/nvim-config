-- Fast colorscheme alternatives to Catppuccin
-- Uncomment one to try it, and disable catppuccin.lua

return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		style = "night", -- storm, moon, night, day
	-- 		transparent = true,
	-- 		terminal_colors = false,
	-- 		styles = {
	-- 			comments = { italic = true },
	-- 			keywords = { italic = true },
	-- 			functions = {},
	-- 			variables = {},
	-- 		},
	-- 		sidebars = { "qf", "help", "terminal", "packer" },
	-- 		day_brightness = 0.3,
	-- 		hide_inactive_statusline = false,
	-- 		dim_inactive = false,
	-- 		lualine_bold = false,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("tokyonight").setup(opts)
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	--
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		variant = "moon", -- auto, main, moon, dawn
	-- 		dark_variant = "moon",
	-- 		dim_inactive_windows = false,
	-- 		extend_background_behind_borders = true,
	-- 		styles = {
	-- 			bold = false,
	-- 			italic = true,
	-- 			transparency = true,
	-- 		},
	-- 		groups = {
	-- 			border = "muted",
	-- 			link = "iris",
	-- 			panel = "surface",
	-- 			error = "love",
	-- 			hint = "iris",
	-- 			info = "foam",
	-- 			note = "pine",
	-- 			todo = "rose",
	-- 			warn = "gold",
	-- 			git_add = "foam",
	-- 			git_change = "rose",
	-- 			git_delete = "love",
	-- 			git_dirty = "rose",
	-- 			git_ignore = "muted",
	-- 			git_merge = "iris",
	-- 			git_rename = "pine",
	-- 			git_stage = "iris",
	-- 			git_text = "rose",
	-- 			git_untracked = "subtle",
	-- 		},
	-- 		highlight_groups = {},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("rose-pine").setup(opts)
	-- 		vim.cmd.colorscheme("rose-pine")
	-- 	end,
	-- },
	--
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	enabled = false,
	-- 	opts = {
	-- 		compile = false,
	-- 		undercurl = true,
	-- 		commentStyle = { italic = true },
	-- 		functionStyle = {},
	-- 		keywordStyle = { italic = true },
	-- 		statementStyle = { bold = true },
	-- 		typeStyle = {},
	-- 		transparent = true,
	-- 		dimInactive = false,
	-- 		terminalColors = false,
	-- 		colors = {
	-- 			palette = {},
	-- 			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 		},
	-- 		theme = "wave", -- Load "wave" theme when 'background' option is not set
	-- 		background = {
	-- 			dark = "wave",
	-- 			light = "lotus"
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("kanagawa").setup(opts)
	-- 		vim.cmd.colorscheme("kanagawa")
	-- 	end,
	-- },

	-- Option 4: Minimal Catppuccin (Stripped down for performance)
	{
		"catppuccin/nvim",
		name = "catppuccin-minimal",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				term_colors = true,
				-- Disable ALL integrations for maximum performance
				integrations = {},
				compile = {
					enabled = true,
					path = vim.fn.stdpath("cache") .. "/catppuccin",
				},
				auto_integrations = true,
				compile = {
					enabled = true,
				},
			})

			-- Force recompilation for the new minimal config
			-- require("catppuccin").compile()
			vim.cmd.colorscheme("catppuccin")
		end,
	}
}
