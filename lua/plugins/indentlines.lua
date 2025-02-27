return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = true,
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        require("ibl").setup()
    end,
}
