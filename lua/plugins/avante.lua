return {
	-- Copilot and related plugins
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "bundled_build.lua", -- Bundles `mcp-hub` binary along with the neovim plugin
		cmd = {
			"MCPHub",
		},
		config = function()
			require("mcphub").setup({
				use_bundled_binary = true, -- Use local `mcp-hub` binary
			})
		end,
	},
	{
		"yetone/avante.nvim",
		build = "make",
		version = false, -- Never set this value to "*"! Never!
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "markdown", "Avante" } },
				ft = { "markdown", "Avante" },
			},
		},
		keys = {
			{ "<leader>ua", mode = { "n", "v" } },
			{ "<leader>ue", mode = { "n", "v" } }
		},
		cmd = { "AvanteAsk", "AvanteEdit", "AvanteRefresh" },
		opts = {
			provider = "zllm",
			providers = {
				bedrock = {
					model = "eu.anthropic.claude-3-5-sonnet-20241022-v2:0",
					aws_profile = "playground.Administrator",
					aws_region = "eu-central-1",
				},
				zllm = {
					__inherited_from = 'openai',
					endpoint = "https://zllm.data.zalan.do/v1/",
					model = "bedrock/anthropic.claude-sonnet-4-20250514-v1:0",
					api_key_name = "cmd:ztoken",
					extra_request_body = {
						temperature = 0.3,
						max_tokens = 4192,
					},
				},
			},
			mappings = {
				ask = "<leader>ua",
				edit = "<leader>ue",
				refresh = "<leader>ur",
			},
			windows = {
				position = "right",
				wrap = true,
				width = 30, -- % based on available width
				sidebar_header = {
					align = "center",
					rounded = true,
				},
			},
			highlights = {
				diff = {
					current = "DiffText",
					incoming = "DiffAdd",
				},
			},
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]x",
				prev = "[x",
			},
			--- @class AvanteSuggestionMappings
			suggestion = {
				accept = "<M-l>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
			behavior = {
				auto_suggestions = false,
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
			},
			hints = { enabled = true },
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,
			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,
		},
	},
}
