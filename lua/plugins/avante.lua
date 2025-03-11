return {
    -- Copilot and related plugins
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end,
    -- },

    -- {
    --     "zbirenbaum/copilot-cmp",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end
    -- },

    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     branch = "main",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "zbirenbaum/copilot.lua",
    --         "nvim-lua/plenary.nvim",
    --     },
    -- },

    -- Avante AI Assistant
    {
        "yetone/avante.nvim",
        event = "InsertEnter",
        lazy = true,
        build = "make", -- use "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            -- "zbirenbaum/copilot.lua",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = { file_types = { "markdown", "Avante" } },
                ft = { "markdown", "Avante" },
            },
        },
        -- keys = function(_, keys)
        --     ---@type avante.Config
        --     local opts =
        --         require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)
        --
        --     local mappings = {
        --         {
        --             opts.mappings.ask,
        --             function() require("avante.api").ask() end,
        --             desc = "avante: ask",
        --             mode = { "n", "v" },
        --         },
        --         {
        --             opts.mappings.refresh,
        --             function() require("avante.api").refresh() end,
        --             desc = "avante: refresh",
        --             mode = "v",
        --         },
        --         {
        --             opts.mappings.edit,
        --             function() require("avante.api").edit() end,
        --             desc = "avante: edit",
        --             mode = { "n", "v" },
        --         },
        --     }
        --     mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
        --     return vim.list_extend(mappings, keys)
        -- end,
        opts = {
            provider = "openai",
            auto_suggestions_provider = "openai",
            openai = {
                endpoint = "https://zllm.data.zalan.do/v1/",
                model = "bedrock/anthropic.claude-3-7-sonnet-20250219-v1:0",
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
        },
    },
}
