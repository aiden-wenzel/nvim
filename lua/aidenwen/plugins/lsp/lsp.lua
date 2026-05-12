return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
	},

	config = function()
		require("mason").setup()
		vim.lsp.enable("pyright")
		local opts = {}
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true


		vim.lsp.enable("lua_ls")
		vim.lsp.enable("html")
		vim.lsp.enable("cssls")
		vim.lsp.enable("clangd")

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = {"vim"}
					}
				}
			}
		})
		vim.lsp.config('html', {
			capabilities = capabilities,
		})
		vim.lsp.config('cssls', {
			capabilities = capabilities,
		})

		-- Key binds
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
	end
}
