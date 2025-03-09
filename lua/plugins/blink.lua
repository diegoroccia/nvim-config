local M = {
    'saghen/blink.cmp',
    dependencies = {
        'Kaiser-Yang/blink-cmp-avante',
        'rafamadriz/friendly-snippets',
    },
    event = "InsertEnter",

    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        signature = { enabled = true },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            ghost_text = {
                enabled = true
            }
        },
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'avante', 'path', 'snippets', 'buffer' },
            per_filetype = {
                ['yaml.cdp'] = { 'lsp' }
            },
            providers = {
                avante = {
                    module = 'blink-cmp-avante',
                    name = 'avante',
                }
            }
        },
    },
    opts_extend = { "sources.default" },
}

return M
