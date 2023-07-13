local lsp = require("lsp-zero").preset({})

-- we have mason.nvim installed so we dont need this
-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
--lsp.setup_servers({'tsserver', 'eslint'})

-- Primeagen's personal set up borrowed
lsp.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
	"jdtls", -- Eclipse Java Language Server
	"rust_analyzer",
	"solargraph",
})

-- Fix undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- now that we have set completion navigation mappings, we need to mute tab and s-tab
cmp_mappings["<TAB>"] = nil
cmp_mappings["<S-TAB>"] = nil

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.set_preferences({
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local function lsp_keymaps(bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>ws", function()
		vim.ls.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>df", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next({ border = "rounded" })
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev({ border = "rounded" })
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	-- call ":Format" to be able to format the current buffer.
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

-- on attach happens after every single buffer that has an lsp that is associated with it.
-- that means we will have all these remaps only exist for the current buffer that we are on
-- (buffer means text we are editting right currently). Buf if we do have an LSP, we will use
-- our LSP instead.
lsp.on_attach(function(client, bufnr)
	lsp_keymaps(bufnr)
	-- format on save
	--vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
end)

-- end of borrow

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
