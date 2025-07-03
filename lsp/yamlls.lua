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
				["https://cloud-utils-test.s3.amazonaws.com/delivery.yaml.schema.2017-09-20.yaml"] =
				"delivery.yaml",
				["schema.yaml"] = "clusters/*.yaml",
			},
			validate = true,
			completion = true,
			hover = true,
			format = {
				enable = true
			}
		}
	}
}

return M
