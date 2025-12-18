return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		enabled = true,
		event = "BufReadPre *.lua",
		opts = {
			library = {
				{ path = vim.env.VIMRUNTIME,   words = { "vim" } },
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "LazyVim",            words = { "LazyVim" } },
				{ path = "snacks.nvim",        words = { "Snacks", "snacks" } },
				{ path = "lazy.nvim",          words = { "LazyVim" } },
			},
		},
	},
}
