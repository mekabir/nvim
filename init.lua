-- disable netrw at the very start of your init.lua so it wont interfere with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("mekabir")

-- for gruvbox
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme catppuccin]])
vim.g.transparent_enabled = true
