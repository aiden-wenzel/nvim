return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",

        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_select = {bahavior = cmp.SelectBehavior.Select}

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
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
                ['<S-Tab'] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
            }),

            sources = cmp.config.sources({
                {name = 'nvim_lsp'},
                {name = 'luasnip'},
                {name = 'nvim_lsp_signature_help'},
                {name = 'buffer'},
            })
        })
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
