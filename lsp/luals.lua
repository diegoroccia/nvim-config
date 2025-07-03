local M = {
	-- Command and arguments to start the server.
	cmd = { 'lua-language-server' },

	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },

	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	root_markers = { '.luarc.json', '.luarc.jsonc' },

	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			codeLens = {
				enable = true,
			},
			completion = {
				callSnippet = "Replace",
			},
			doc = {
				privateName = { "^_" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					{ path = vim.env.VIMRUNTIME,   words = { "vim" } },
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					{ path = "LazyVim",            words = { "LazyVim" } },
					{ path = "snacks.nvim",        words = { "Snacks" } },
					{ path = "lazy.nvim",          words = { "LazyVim" } },
				}
			}
		}
	}
}

return M
