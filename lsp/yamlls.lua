local M = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.cloudformation", "yaml.cdp" },
    settings = {
        yaml = {
            schemaStore = {
                enable = true,
            },
            schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.31.2/all.json"] =
                "/*.k8s.yaml",
                [vim.fn.stdpath('config') .. "/lsp/delivery.yaml.schema.2017-09-20.yaml"] = "delivery.yaml",
            },
            validate = true,
            completion = true,
            hover = true,
        }
    }
}

return M
