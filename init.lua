-- disable netrw at the very start of your init.lua so it wont interfere with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('mekabir')

vim.cmd [[colorscheme catppuccin]]
