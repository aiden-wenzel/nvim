return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
	},

	config = function()
		require("mason").setup()
		vim.lsp.enable("pyright")
		local opts = {}

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

		-- Key binds
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	end
}
