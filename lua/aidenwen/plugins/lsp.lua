local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

require("mason").setup({})
require("mason-nvim-dap").setup({
    ensure_installed = { "python", "clangd" }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pylsp",
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities
            })
        end,
    }
})

require("lspconfig").clangd.setup({
    capabilities = capabilities;
    settings = {
        clangd = {
            includePath = {"~/cli_blackjack/include/cli_blackjack"}
        }
    }
})

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['C-p'] = cmp.mapping.select_prev_item(cmp_select),
        ['C-n'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        {name = "nvim_lsp"},
        {name = "nvim_lsp_signature_help"},
        {name = "luasnip"},
        {name = "buffer"}
    })
})
