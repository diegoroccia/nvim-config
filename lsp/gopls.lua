local M = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            hints = {
                rangeVariableType = true,
                parameterNames = true,
                assignVariableTypes = true
            }
        }
    },
    single_file_support = true,
}

return M
