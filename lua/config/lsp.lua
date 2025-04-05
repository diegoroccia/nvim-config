vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.lsp.enable({
    "luals",
    "gopls",
    "pyright",
    "ruff_lsp",
    "tsserver",
    "yamlls",
    "json",
    "cue",
    "kcl",
    "markdown",
    "regal"
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.bo[args.buf].formatexpr = nil
        vim.bo[args.buf].omnifunc = nil


        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        assert(client ~= nil, "LSP client not found")

        -- if client:supports_method('textDocument/completion') then
        --     -- Enable auto-completion
        --     vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        -- end

        if client:supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    if client ~= nil then
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end
                end,
            })
        end

        if client.server_capabilities.foldingRangeProvider and client.name ~= "regal" then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end

        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable()
        end

        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end

        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation
            map("gI", Snacks.picker.lsp_implementations, "Goto Implementation")
        end

        map("gd", Snacks.picker.lsp_definitions, "Goto Definition")
        map("gD", Snacks.picker.lsp_declarations, "Goto Declaration")
        map("gr", Snacks.picker.lsp_references, "References")
        map("gy", Snacks.picker.lsp_type_definitions, "Goto T[y]pe Definition")
        map("<leader>ss", Snacks.picker.lsp_symbols, "LSP Symbols")
        map("<leader>sS", Snacks.picker.lsp_workspace_symbols, "LSP Workspace Symbols")

        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>=", vim.lsp.buf.format, "Format Buffer")
    end,
})
