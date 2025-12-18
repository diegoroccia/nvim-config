return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						view = {
							stack_upwards = true, -- Display notification items from bottom to top
							icon_separator = " ", -- Separator between group name and icon
							group_separator = "---", -- Separator between notification groups
							group_separator_hl = -- Highlight group used for group separator
							"Comment",
							render_message = -- How to render notification messages
							    function(msg, cnt)
								    return cnt == 1 and msg or
								    string.format("(%dx) %s", cnt, msg)
							    end,
						},
					}
				}
			}
		},
		opts = {}
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				go = { "gofumpt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			-- Use LSP formatting as fallback if no formatter is configured
			format_on_save = function(bufnr)
				-- Disable for files in certain directories or if LSP formatting is available
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") then
					return
				end

				-- Prefer LSP formatting if available, otherwise use conform
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				for _, client in ipairs(clients) do
					if client.supports_method("textDocument/formatting") then
						return -- Let LSP handle formatting
					end
				end

				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		},
	}
}
