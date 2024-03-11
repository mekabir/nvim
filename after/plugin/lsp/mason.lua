require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
        "tsserver",
        "eslint",
        "lua_ls",
        "jdtls", -- Eclipse Java Language Server
        "pyright",
        "rust_analyzer",
        "solargraph",
    },
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = true,
    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = {
        require("lsp-zero").default_setup,
        -- to ignore a language server use lsp_zero.noop e.g.,
        -- tsserver = lsp_zero.noop,
        --
        -- Also see :help lsp-zero-guide:integrate-with-mason-nvim
        -- to learn how to add custom configuration for a server
    },
})

