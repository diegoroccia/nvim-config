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
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
        },
    },
}
