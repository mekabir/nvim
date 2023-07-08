-- null ls provides formatting, linting, code actions, completions, and hover.
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics -- linting
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

-- declaring the leader
null_ls.setup({
	sources = {
		-- you can call :NullLsInfo while having a particular file, and
		-- see all the sources available for that type of file,
		-- then you can come here and declare it as a source.
		-- You have to make sure you have it on your machine as a binary
		-- and accessible on your $PATH.
		completion.spell, -- spell checker

		-- python
		formatting.black.with({
			extra_args = {
				"--line-length=120",
				"--verbose",
			},
		}), -- python formatting
		formatting.isort.with({
            extra_args = {
			    "--profile=black",
            }
		}),
		diagnostics.flake8.with({
			extra_args = {
				"--max-line-length=120",
				"--extend-ignore=E203",
			},
		}), -- python linting

		-- js
		diagnostics.eslint, -- JS linting
		formatting.prettier.with({
			extra_args = {
				"--single-quote",
				"--jsx-single-quote",
			},
			filetypes = {
				"html",
				"css",
				"yaml",
				"markdown",
				"json",
			},
		}), -- JS formatting

		-- ts
		diagnostics.eslint_d,

		-- lua
		formatting.stylua, -- lua formatting

		-- rust
		formatting.rustfmt.with({
			extra_args = {
				"--edition=2021",
			},
		}),
	},

	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = vim.lsp.buf.format,
				group = group,
			})
		end
	end,
})

-- set spell check on
vim.opt.spell = true
