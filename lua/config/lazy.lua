local vim = _G.vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "catppuccin" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
    dev = {
        ---@type string | fun(plugin: LazyPlugin): string
        path = "~/code/zalando-personal/",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = { "diego-roccia_zse" }, -- For example {"folke"}
        fallback = false,                  -- Fallback to git when local plugin doesn't exist
    },
    performance = {
        -- cache = {
        --     enabled = true
        -- },
        rtp = {
            -- paths = {
            --   vim.fn.stdpath("data") .. "/lazy/blink-cmp-git",
            -- },
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
