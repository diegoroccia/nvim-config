return {
    {
        "nvim-lualine/lualine.nvim",
        enable = false,
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    globalstatus = true,
                    always_divide_middle = true,
                    component_separators = { left = "", right = "" },
                    -- section_separators = { left = "", right = "" },
                },
                extensions = { "quickfix", "nvim-tree", "fugitive", "fzf", "trouble", "lazy" },
                tabline = {
                    lualine_a = { "buffers" },
                    lualine_b = {},
                    lualine_y = { "tabs" },
                },

                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                sections = {
                    lualine_x = {
                        "trouble",
                        "fileformat",
                        "filetype",
                        function()
                            if require("checkupdate").update_available then
                                return "🚀"
                            else
                                return ""
                            end
                        end,
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = { fg = "#ff9e64" },
                        },
                    },
                    -- lualine_z = { 'copilot', }
                },
            })
        end,
    },
}
