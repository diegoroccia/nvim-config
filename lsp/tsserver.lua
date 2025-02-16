local M = {
    cmd = { 'typescript-language-server', '--stdio' },
    init_options = {
        hostInfo = 'neovim',
        completions = {
            completeFunctionCalls = true,
        },

        preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            -- importModuleSpecifierPreference = 'non-relative',
            importModuleSpecifierPreference = "relative",
            importModuleSpecifierEnding = "minimal",
        },
    },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    single_file_support = true,
}

return M
