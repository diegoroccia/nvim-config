return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀
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
                    { key = "c", icon = " ", desc = "Configuration", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", padding = 1 },
                    { section = "startup", padding = 1 },

                    {
                        pane = 2,
                        icon = " ",
                        title = "Open PRs",
                        cmd =
                        "GH_PAGER= gh pr list --repo github.bus.zalan.do/base-infrastructure/aws-base-infrastructure",
                        action = function()
                            vim.fn.jobstart("gh pr list --web", { detach = true })
                        end,
                        height = 7,
                    },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Open PRs",
                        cmd =
                        "GH_PAGER= gh pr list --repo github.bus.zalan.do/base-infrastructure/aws-network-infrastructure",
                        action = function()
                            vim.fn.jobstart("gh pr list --web", { detach = true })
                        end,
                        height = 7,
                    },
                },
            },
        },
    },
}
