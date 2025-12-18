return {
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        opts = { use_diagnostic_signs = true },
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        opts = {
            auto_enable = true,
            auto_resize_height = true,
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                should_preview_cb = function(bufnr, qwinid)
                    local ret = true
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    local fsize = vim.fn.getfsize(bufname)
                    if fsize > 100 * 1024 then
                        -- skip file size greater than 100k
                        ret = false
                    elseif bufname:match("^fugitive://") then
                        -- skip fugitive buffer
                        ret = false
                    end
                    return ret
                end,
            },
            func_map = {
                drop = "o",
                openc = "O",
                split = "<C-s>",
                vsplit = "<C-v>",
                tab = "t",
                tabb = "T",
                tabc = "<C-t>",
                tabdrop = "",
                ptogglemode = "z,",
                pscrollup = "<C-b>",
                pscrolldown = "<C-f>",
                pscrollorig = "zo",
                prevfile = "<C-p>",
                nextfile = "<C-n>",
                prevhist = "<",
                nexthist = ">",
                lastleave = "'\"",
                stoggleup = "<S-Tab>",
                stoggledown = "<Tab>",
                stogglevm = "<Tab>",
                stogglebuf = "'"
            },
            filter = {
                fzf = {
                    action_for = { ["ctrl-s"] = "split", ["ctrl-v"] = "vsplit" },
                    extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " }
                }
            }
        }
    },
}
