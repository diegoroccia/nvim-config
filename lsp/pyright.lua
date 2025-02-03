local M = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    single_file_support = true,
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true,
                typeCheckingMode = "on",
            },
        },
    },
}

return M
