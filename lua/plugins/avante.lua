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
        "yetone/avante.nvim",
        event = "VeryLazy",
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
        opts = {
            provider = "openai",
            auto_suggestions_provider = "openai",
            openai = {
                endpoint = "https://zllm.data.zalan.do/v1/",
                -- model = "bedrock/anthropic.claude-3-7-sonnet-20250219-v1:0",
                model = "gemini/gemini-2.0-flash-001",
                temperature = 0,
                max_tokens = 4096,
                api_key_name = "cmd:ztoken",
            },
            mappings = {
                ask = "<leader>ua",
                edit = "<leader>ue",
                refresh = "<leader>ur",
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
            },
            behaviour = {
                auto_suggestions = false,
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
            },
            hints = { enabled = true },
            windows = {

                input = {
                    prefix = "> ",
                    height = 2, -- Height of the input window in vertical layout
                },
            }
        },
    },
}
