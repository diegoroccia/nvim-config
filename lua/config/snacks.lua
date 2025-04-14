local M = {
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
        only_scope = true, -- only show indent guides of the scope
        only_current = true,
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
            {
                section = "header"
            },
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
            -- { icon = " ", title = "Projects", section = "projects", indent = 1, padding = 1, pane = 2 },
            { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1, pick = true, session = false },
            { title = "Sessions", padding = 1 },
            -- {
            --     pane = 2,
            --     icon = " ",
            --     title = "Projects",
            --     section = "projects",
            --     indent = 2,
            --     padding = 1,
            --     pick = false,
            --     session = false,
            --     action = function(dir)
            --         Snacks.picker.files({ dir })
            --     end
            -- },

            { section = "startup", padding = 1, width = 33 },
        },
    },
    styles = {
        notification = {
            wo = { wrap = true } -- Wrap notifications
        },
    },
}


return M
