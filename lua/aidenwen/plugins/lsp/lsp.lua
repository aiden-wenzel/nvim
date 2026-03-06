return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
	},

	config = function()
		require("mason").setup()
		vim.lsp.enable("pyright")

		vim.lsp.enable("lua_ls")
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = {"vim"}
					}
				}
			}
		})

		vim.lsp.enable("clangd")

	end
}
