local builtin = require('telescope.builtin')
-- fuzzy finder in project files (not exclusive to git files) in normal mode
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- fuzzy finder in files that are in git in normal mode
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- launches fuzzy finder to search the project.
-- function runs when command is triggered.  
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

