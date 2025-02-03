return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.ai").setup()
            require("mini.basics").setup()
            -- require("mini.cursorword").setup()
            -- require("mini.sessions").setup()
            require("mini.surround").setup()
            require("mini.map").setup()
            require("mini.icons").setup()
            -- require("mini.statusline").setup()
        end,
    },
}
