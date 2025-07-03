return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- 'arkav/lualine-lsp-progress'
			{
				"NStefan002/screenkey.nvim",
				lazy = false,
				version = "*", -- or branch = "main", to use the latest commit
			}
		},
		event = "BufReadPre",
		opts = {
			options = {
				theme = "catppuccin",
				globalstatus = true,
				always_divide_middle = false,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				icons_enabled = true,
			},
			extensions = { "quickfix", "trouble", "lazy" },
			tabline = {
				lualine_a = { { "buffers", mode = 2, separator = { left = '' }, right_padding = 2 } },
				lualine_z = {
					{ 'tabs', separator = { right = '' }, left_padding = 2 },
				},
			},
			sections = {
				lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
				lualine_b = {
				},
				lualine_c = {
					"lsp_progress",
				},
				lualine_x = {
					"trouble",
					function()
						return require("screenkey").get_keys()
					end,
				},
				lualine_y = {
					"filetype",
					"fileformat",
				},
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
		}
	},
}
