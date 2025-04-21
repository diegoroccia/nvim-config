return {
    {
        "echasnovski/mini.nvim",
        version = false,
        enabled = false,
        event = "BufReadPre",
        config = function()
            -- require("mini.ai").setup()
            require("mini.basics").setup()
            require("mini.pairs").setup()
            require("mini.surround").setup()
            -- require("mini.pick").setup()
            -- require("mini.cursorword").setup()
            -- require("mini.sessions").setup()
            -- require("mini.map").setup()
            -- require("mini.icons").setup()
            -- require("mini.statusline").setup()
        end,
    },
}
