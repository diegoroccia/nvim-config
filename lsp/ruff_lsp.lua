local M = {
    cmd = { 'ruff-lsp' },
    filetypes = { 'python' },
    single_file_support = true,
    settings = {
        ruff_lsp = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    },
}

return M
