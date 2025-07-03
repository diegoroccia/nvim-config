map("<leader>sD", Snacks.picker.diagnostics, "Diagnostics")
map("<leader>sd", Snacks.picker.diagnostics_buffer, "Buffer Diagnostics")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

Snacks.toggle.option("spell", { name = "Spelling" }):map("\\s")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("\\w")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("\\L")
Snacks.toggle.diagnostics():map("\\d")
Snacks.toggle.line_number():map("\\l")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
	"\\c")
Snacks.toggle.treesitter():map("\\T")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("\\b")
Snacks.toggle.inlay_hints():map("\\h")
Snacks.toggle.indent():map("\\g")
Snacks.toggle.dim():map("\\D")
---@class snacks.toggle.Opts
---@field id? string
---@field name string
---@field get fun():boolean
---@field set fun(state:boolean)

---@param ... snacks.toggle.Opts
Snacks.toggle.new({
	id = "screen-key",
	name = "ScreenKey",
	get = function() return require("screenkey").is_active() end,
	set = function(_) require("screenkey").toggle() end
}):map("\\k")
