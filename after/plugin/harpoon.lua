local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- vim key map set in normal mode we want to press leader a and add the current file to harpoon.
vim.keymap.set("n", "<leader>a", mark.add_file)
-- we want to be able to in normal mode press CTRL + E and
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Navigation
-- in normal mode CTRL-h will navigate to file 1, and so on.
vim.keymap.set("n", "<C-1>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-2>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-3>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-4>", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<C-5>", function()
	ui.nav_file(5)
end)
