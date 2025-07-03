local M = {
	cmd = { 'vscode-json-language-server', '--stdio' },
	filetypes = {
		'json',
	},
	single_file_support = true,
	settings = {
		json = {
			format = {
				enable = true
			}
		},
		validate = { enable = true },
	}
}

return M
