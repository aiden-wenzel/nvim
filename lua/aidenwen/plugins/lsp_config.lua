local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('cmp').setup({
  sources = {
    { name = 'nvim_lsp' }
  }
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
            require("lspconfig").clangd.setup({
                capabilities = capabilities,
            })
        end,
    },
})

