return {
	{
		"echasnovski/mini.nvim",
		version = false,
		enabled = true,
		event = "InsertEnter",
		config = function()
			-- Only load the modules we actually use
			require("mini.pairs").setup({
				modes = { insert = true, command = false, terminal = false }
			})
			require("mini.surround").setup({
				search_method = "cover_or_next"
			})
		end,
	},
}
