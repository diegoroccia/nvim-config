return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        enabled = true,
        opts = {
            library = {
                { path = vim.env.VIMRUNTIME,                words = { "vim" } },
                { path = vim.fn.stdpath("data") .. "/lazy", words = { "vim", "snacks" } },
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library",              words = { "vim%.uv" } },
            },
        },
    },
}
