-- null ls provides formatting, linting, and more.
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

-- declaring the leader
null_ls.setup({
    sources = {
        formatting.prettier,                            -- JS formatting
        formatting.black,                               -- python formatting 
        formatting.stylua,                              -- lua formatting
        diagnostics.eslint,                             -- JS linting
        completion.spell,                              -- spell checker
        diagnostics.flake8,                             -- python linting
    },
})


-- set spell check on
vim.opt.spell = true
