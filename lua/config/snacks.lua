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

            { icon = " ", key = "q", desc = "Quit", action = ":qa", padding = 1 },

            {
                icon = " ",
                key = "r",
                desc = "Repositories",
                action = function()
                    Snacks.dashboard.pick(require("zalando.pickers"))
                end,
                pane = 1
            },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 1, padding = 1, pane = 2 },
            {
                pane = 2,
                icon = " ",
                title = "Open issues",
                section = "terminal",
                cmd =
                "GH_PAGER='' gh search issues --owner zalando-build --state open --assignee @me --json repository,number,title --jq  '.[] | [ .repository.name, \"#\" + (.number|tostring), .title ]| @tsv'",
                height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
            },
            {
                pane = 2,
                icon = " ",
                title = "Open PRs",
                section = "terminal",
                cmd =
                "GH_PAGER='' gh search prs --owner zalando-build --state open --assignee @me --json repository,number,title --jq  '.[] | [ .repository.name, \"#\" + (.number|tostring), .title ]| @tsv'",
                height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
            },
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
