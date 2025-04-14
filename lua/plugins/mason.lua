return {
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            {
                "j-hui/fidget.nvim",
                opts = {
                    notification = {
                        view = {
                            stack_upwards = true,    -- Display notification items from bottom to top
                            icon_separator = " ",    -- Separator between group name and icon
                            group_separator = "---", -- Separator between notification groups
                            group_separator_hl =     -- Highlight group used for group separator
                            "Comment",
                            render_message =         -- How to render notification messages
                                function(msg, cnt)
                                    return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
                                end,
                        },
                    }
                }
            }
        },
        opts = {}
    },
    {
        "stevearc/conform.nvim",
        event = "BufReadPre",
    }
}
