-- null ls provides formatting, linting, code actions, completions, and hover.
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics        -- linting
local completion = null_ls.builtins.completion

-- declaring the leader
null_ls.setup({
    sources = {
        -- you can call :NullLsInfo while having a particular file, and
        -- see all the sources available for that type of file, 
        -- then you can come here and declare it as a source. 
        -- You have to make sure you have it on your machine as a binary
        -- and accessible on your $PATH.
        formatting.prettier.with{
            extra_args = {
                '--single-quote',
                '--jsx-single-quote'
            }},                                         -- JS formatting
        formatting.black,                               -- python formatting 
        formatting.stylua,                              -- lua formatting
        diagnostics.eslint,                             -- JS linting
        completion.spell,                               -- spell checker
        diagnostics.flake8,                             -- python linting
    },
})


-- set spell check on
vim.opt.spell = true
