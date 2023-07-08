-- in normal mode if we hit <leader>gs we want execute vim command git status.
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
