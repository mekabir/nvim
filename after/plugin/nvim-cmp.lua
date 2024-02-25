local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local autopairs_handlers = require("nvim-autopairs.completion.handlers")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})


cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
        filetypes = {
            -- "*" is a alias to all filetypes
            ["*"] = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = autopairs_handlers["*"]
                }
            },
        }
    })
)
