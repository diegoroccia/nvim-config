return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            explorer = {
                enabled = true,
                replace_netrw = true, -- Replace netrw with the snacks explorer
            },
            bigfile = { enabled = true },
            notifier = { enabled = true },
            statuscolumn = { enabled = true },
            toggle = { enabled = true },
            indent = {
                enabled = true,
                only_scope = false, -- only show indent guides of the scope
                only_current = false,
                chunk = {
                    enabled = true,
                },
            },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
┌──────────────────────────────────────────────────────────╮
│ ⣴⣿⣿⣿⣶⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀│
│ ⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⠀⠀⠘⠛⠛⢛⣿⡇⠀⠚⠛⠛⠛⣿⡆⠀⣿⠀⠀⠛⠛⠛⠛⣿⠀⢠⡞⠛⠛⠛⣷⠀⢠⡾⠛⠛⠛⣿⡇⢠⡞⠛⠛⠻⣶⡄⠀│
│ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⠀⠀⠀⣠⠟⠋⠀⠀⣤⠶⠒⠒⣿⡇⠀⣿⠀⠀⣤⠶⠒⠒⣿⠀⢸⡇⠀⠀⠀⣿⠀⢸⡇⠀⠀⠀⣿⡇⢸⡇⠀⠀⠀⣿⡇⠀│
│ ⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢠⣾⣛⣀⣀⡀⠀⣯⣀⣀⣀⣿⡇⠀⣿⣀⠀⣿⣀⣀⣀⣿⠀⢸⡇⠀⠀⠀⣿⠀⠘⣧⣀⣀⣀⣿⡇⠘⣧⣀⣀⣠⣿⠃⠀│
│ ⠻⣿⣿⣿⠿⠛⠋⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠀⠈⠉⠛⠉⠉⠀⠀⠉⠉⠀⠉⠉⠛⠉⠉⠀⠈⠁⠀⠀⠀⠉⠀⠀⠈⠉⠛⠉⠉⠀⠀⠈⠉⠛⠉⠀⠀⠀│
╰──────────────────────────────────────────────────────────┘
Diego Roccia - Team Linus - Zalando SE]],
                },
                sections = {
                    { section = "header" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = function()
                            Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
                        end
                    },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },

                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa", padding = 1 },

                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 1, padding = 1, pane = 2 },
                    { icon = " ", title = "Projects", section = "projects", indent = 1, padding = 1, pane = 2 },

                    -- { section = "keys",    pane = 2 },
                    { section = "startup", padding = 1, width = 33 },
                },
            },
            styles = {
                notification = {
                    wo = { wrap = true } -- Wrap notifications
                }
            },
        },
        keys = {
            -- Top Pickers & Explorer
            { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
            { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
            { "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
            { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
            { "<leader>f",       function() Snacks.explorer() end,               desc = "File Explorer" },
        }
    },
}
