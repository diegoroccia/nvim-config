vim.filetype.add({
    filename = {
        ['delivery.yaml'] = "yaml.cdp",
    },
    extension = {
        ["cf.yaml"] = "cloudformation",
        ["yaml"] = function(path, bufnr)
            local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''
            if first_line:match('AWSTemplateFormatVersion') then
                return "yaml.cloudformation"
            end
        end
    }
})
