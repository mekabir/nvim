local lsp_zero = require("lsp-zero").preset({})

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- we have mason.nvim installed so we dont need this
-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
--lsp_zero.setup_servers({'tsserver', 'eslint'})


-- start Integrate with mason.nvim
-- See :help lsp-zero-guide:integrate-with-mason-nvim
--lsp_zero.on_attach(function(client, bufnr)
--    -- see :help lsp-zero-keybindings
--    -- to learn the available actions
--    lsp_zero.default_keymaps({ buffer = bufnr })
--end)

--require('mason').setup({})
--require('mason-lspconfig').setup({
--    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
--    -- This setting has no relation with the `automatic_installation` setting.
--    ---@type string[]
--    ensure_installed = {
--        "tsserver",
--        "eslint",
--        "lua_ls",
--        "jdtls", -- Eclipse Java Language Server
--        "pyright",
--        "rust_analyzer",
--        "solargraph",
--    },
--    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
--    -- This setting has no relation with the `ensure_installed` setting.
--    -- Can either be:
--    --   - false: Servers are not automatically installed.
--    --   - true: All servers set up via lspconfig are automatically installed.
--    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
--    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
--    ---@type boolean
--    automatic_installation = true,
--    -- See `:h mason-lspconfig.setup_handlers()`
--    ---@type table<string, fun(server_name: string)>?
--    handlers = {
--        lsp_zero.default_setup,
--        -- to ignore a language server use lsp_zero.noop e.g.,
--        -- tsserver = lsp_zero.noop,
--        --
--        -- Also see :help lsp-zero-guide:integrate-with-mason-nvim
--        -- to learn how to add custom configuration for a server
--    },
--})
---- end Integrate with mason.nvim


-- start Configure lua language server for Neovim
-- see :help lsp-zero-guide:lua-lsp-for-neovim
-- fixed config (not project specific)

--lsp_zero.on_attach(function(client, bufnr)
--    -- see :help lsp-zero-keybindings
--    -- to learn the available actions
--    lsp_zero.default_keymaps({ buffer = bufnr })
--end)



-- end Configure lua language server for Neovim



--lsp_zero.set_preferences({
--    sign_icons = {
--        error = "E",
--        warn = "W",
--        hint = "H",
--        info = "I",
--    },
--})

--local function lsp_keymaps(bufnr)
--    local opts = { buffer = bufnr, remap = false }
--
--    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--    vim.keymap.set("n", "gd", function()
--        vim.lsp.buf.definition()
--    end, opts)
--    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--    vim.keymap.set("n", "<leader>H", function()
--        vim.lsp.buf.hover()
--    end, opts)
--    vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--    vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--    vim.keymap.set("i", "<C-h>", function()
--        vim.lsp.buf.signature_help()
--    end, opts)
--    vim.keymap.set("n", "<leader>ws", function()
--        vim.ls.buf.workspace_symbol()
--    end, opts)
--    vim.keymap.set("n", "<leader>df", function()
--        vim.diagnostic.open_float()
--    end, opts)
--    vim.keymap.set("n", "]d", function()
--        vim.diagnostic.goto_next({ border = "rounded" })
--    end, opts)
--    vim.keymap.set("n", "[d", function()
--        vim.diagnostic.goto_prev({ border = "rounded" })
--    end, opts)
--    vim.keymap.set("n", "<leader>ca", function()
--        vim.lsp.buf.code_action()
--    end, opts)
--    vim.keymap.set("n", "<leader>rr", function()
--        vim.lsp.buf.references()
--    end, opts)
--    vim.keymap.set("n", "<leader>rn", function()
--        vim.lsp.buf.rename()
--    end, opts)
--    vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--    -- call ":Format" to be able to format the current buffer.
--    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
--end

-- on attach happens after every single buffer that has an lsp that is associated with it.
-- that means we will have all these remaps only exist for the current buffer that we are on
-- (buffer means text we are editting right currently). Buf if we do have an LSP, we will use
-- our LSP instead.
--lsp_zero.on_attach(function(client, bufnr)
--    lsp_keymaps(bufnr)
--    -- format on save
--    --vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
--end)

-- end of borrow

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())



