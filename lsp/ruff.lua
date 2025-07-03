local M = {
	cmd = { 'ruff', 'server' },
	filetypes = { 'python' },
	single_file_support = true,
	settings = {
		ruff_lsp = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	},
}

return M
