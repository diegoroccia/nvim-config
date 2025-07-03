local M = { {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = {
		'rafamadriz/friendly-snippets',
		"giuxtaposition/blink-cmp-copilot",
	},
	-- use a release tag to download pre-built binaries
	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		--
		keymap = { preset = 'enter' },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
			ghost_text = {
				enabled = true,
				show_with_menu = false
			},
			menu = {
				winblend = 1,
				scrollbar = true,
				draw = {
					treesitter = { 'lsp' },
					columns = {
						{ "kind_icon", "label", gap = 1 }
					},
				},
				auto_show = false
			},
			trigger = {
			},
		},

		signature = {
			enabled = true,
			window = {
				show_documentation = false
			}
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
			per_filetype = {
				['yaml.cdp'] = { 'lsp' }
			},
			providers = {
				copilot = {
					module = 'blink-cmp-copilot',
					name = 'copilot',
					async = true,
					-- score_offset = -1000,
				},
				buffer = {
					min_keyword_length = 5,
				},
				lsp = {
					fallbacks = {},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
} }

-- {
-- 	'saghen/blink.cmp',
-- 	dependencies = {
-- 		"giuxtaposition/blink-cmp-copilot",
-- 		"rafamadriz/friendly-snippets"
-- 	},
-- 	event = "BufReadPre",
--
-- 	version = '*',
-- 	opts = {
-- 		signature = {
-- 			enabled = false,
-- 			window = {
-- 				show_documentation = false
-- 			}
-- 		},
--
-- 		completion = {
-- 			accept = {
-- 				auto_brackets = {
-- 					enabled = true,
-- 				},
-- 			},
-- 			documentation = {
-- 				auto_show = false,
-- 				auto_show_delay_ms = 1000,
-- 				window = {
-- 					border = "rounded",
-- 					winblend = 0,
-- 					scrollbar = true,
-- 				},
-- 			},
-- 			ghost_text = {
-- 				enabled = true,
-- 				show_with_menu = false
-- 			},
-- 			menu = {
-- 				border = "rounded",
-- 				winblend = 0,
-- 				scrollbar = true,
-- 				draw = {
-- 					treesitter = { 'lsp' }
-- 				},
-- 				auto_show = true
-- 			}
-- 		},
-- 		-- 'default' for mappings similar to built-in completion
-- 		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
-- 		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
-- 		-- See the full "keymap" documentation for information on defining your own keymap.
-- 		keymap = { preset = 'enter' },
--
-- 		appearance = {
-- 			use_nvim_cmp_as_default = true,
-- 			nerd_font_variant = 'mono'
-- 		},
--
-- 		-- Default list of enabled providers defined so that you can extend it
-- 		-- elsewhere in your config, without redefining it, due to `opts_extend`
-- 		sources = {
-- 			default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
-- 			per_filetype = {
-- 				['yaml.cdp'] = { 'lsp' }
-- 			},
-- 			providers = {
-- 				copilot = {
-- 					module = 'blink-cmp-copilot',
-- 					name = 'copilot',
-- 					async = true,
-- 					-- score_offset = -1000,
-- 				},
-- 				buffer = {
-- 					min_keyword_length = 5,
-- 				},
-- 				lsp = {
-- 					fallbacks = {},
-- 				},
-- 			},
-- 		},
-- 	},
-- 	opts_extend = { "sources.default" },
-- }

return M
