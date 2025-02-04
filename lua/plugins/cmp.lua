return {
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "onsails/lspkind.nvim",
            -- 'saadparwaiz1/cmp_luasnip',
            -- "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require 'cmp'
            -- local luasnip = require 'luasnip'

            cmp.setup({
                formatting = {
                    expandable_indicator = true,
                    fields = { "kind", "abbr" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                            symbol_map = { Copilot = "" },
                        })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or " ") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"
                        return kind
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = vim.schedule_wrap(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            -- elseif luasnip.expand_or_locally_jumpable() then
                            --     luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                            -- elseif luasnip.locally_jumpable(-1) then
                            --     luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    -- { name = "luasnip" },
                    { name = "path" },
                },
            })

            -- require("luasnip.loaders.from_vscode").lazy_load()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.lsp.config('*', {
                capabilities = capabilities })
        end,
    },
    { "rafamadriz/friendly-snippets" }
}
