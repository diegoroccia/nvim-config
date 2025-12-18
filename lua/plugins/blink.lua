local M = { {
	'saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
		"giuxtaposition/blink-cmp-copilot",
	},
	version = '1.*',

	event = { "InsertEnter", "CmdlineEnter" },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = 'enter' },
		appearance = {
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

return M
