return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            zen = { enabled = true },
            bigfile = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
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
                    header = [[ ⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀
⠀⣴⣿⣿⣿⣶⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⠀⠀⠀⠘⠛⠛⢛⣿⡇⠀⠚⠛⠛⠛⣿⡆⠀⣿⠀⠀⠛⠛⠛⠛⣿⠀⢠⡞⠛⠛⠛⣷⠀⢠⡾⠛⠛⠛⣿⡇⢠⡞⠛⠛⠻⣶⡄⠀⠀
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⠀⠀⠀⠀⣠⠟⠋⠀⠀⣤⠶⠒⠒⣿⡇⠀⣿⠀⠀⣤⠶⠒⠒⣿⠀⢸⡇⠀⠀⠀⣿⠀⢸⡇⠀⠀⠀⣿⡇⢸⡇⠀⠀⠀⣿⡇⠀
⠘⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⢠⣾⣛⣀⣀⡀⠀⣯⣀⣀⣀⣿⡇⠀⣿⣀⠀⣿⣀⣀⣀⣿⠀⢸⡇⠀⠀⠀⣿⠀⠘⣧⣀⣀⣀⣿⡇⠘⣧⣀⣀⣠⣿⠃⠀
⠀⠻⣿⣿⣿⠿⠛⠋⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠁⠀⠈⠉⠛⠉⠉⠀⠀⠉⠉⠀⠉⠉⠛⠉⠉⠀⠈⠁⠀⠀⠀⠉⠀⠀⠈⠉⠛⠉⠉⠀⠀⠈⠉⠛⠉⠀⠀⠀⠀⠀]],
                },
                sections = {
                    { section = "header" },
                    --{ section = "keys",    gap = 1 },
                    { key = "n", icon = " ", desc = "New file", action = ":ene", padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 1, padding = 1 },
                    { icon = " ", title = "Projects", section = "projects", indent = 1, padding = 1 },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = function()
                            Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
                        end
                    },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    -- { section = "keys",    pane = 2 },
                    { section = "startup", padding = 1 },
                    -- {
                    --     pane = 2,
                    --     icon = " ",
                    --     title = "Open PRs",
                    --     cmd = "gh pr list --repo github.bus.zalan.do/base-infrastructure/aws-base-infrastructure",
                    --     action = function()
                    --         vim.fn.jobstart("gh pr list --web", { detach = true })
                    --     end,
                    --     height = 7,
                    --     section = "terminal",
                    -- },
                    -- {
                    --     pane = 2,
                    --     icon = " ",
                    --     title = "Open PRs",
                    --     cmd = "gh pr list --repo github.bus.zalan.do/base-infrastructure/aws-network-infrastructure",
                    --     action = function()
                    --         vim.fn.jobstart("gh pr list --web", { detach = true })
                    --     end,
                    --     height = 7,
                    --     section = "terminal",
                    -- },
                    -- {
                    --     pane = 2,
                    --     icon = " ",
                    --     title = "Git Status",
                    --     section = "terminal",
                    --     cmd = "git status --short --branch --renames",
                    --     height = 5,
                    --     padding = 1,
                    --     ttl = 5 * 60,
                    --     indent = 3,
                    -- },
                },
            },
            styles = {
                notification = {
                    wo = { wrap = true } -- Wrap notifications
                }
            }
        },
    },
}
