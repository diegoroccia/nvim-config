return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            -- 'arkav/lualine-lsp-progress'
        },
        event = "BufReadPre",
        opts = {
            options = {
                theme = "catppuccin",
                globalstatus = true,
                always_divide_middle = false,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                icons_enabled = true,
            },
            extensions = { "quickfix", "trouble", "lazy" },
            tabline = {
                lualine_a = { { "buffers", mode = 2 } },
                lualine_b = {},
                lualine_y = { "tabs" },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
            },
            sections = {
                lualine_x = {
                    "trouble",
                    -- function()
                    --     if require("checkupdate").update_available then
                    --         return "🚀"
                    --     else
                    --         return ""
                    --     end
                    -- end,
                    -- {
                    --     require("lazy.status").updates,
                    --     cond = require("lazy.status").has_updates,
                    --     color = { fg = "#ff9e64" },
                    -- },
                },
                lualine_y = {
                    -- "fileformat",
                    "filetype",
                },
                lualine_c = {
                    "lsp_progress",
                }
            },
        }
    },
}
