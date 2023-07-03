-- need to be able to open up undotree
-- in normal mode we want to use <leader>u to toggle undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
-- dedicate <leader>u to open the undotree sub window
vim.keymap.set('n', '<leader>u', ':UndotreeShow<CR>')
