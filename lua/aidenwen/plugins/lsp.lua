return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	config = function() 
		require("mason").setup({

			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}),

		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd", 
				"cmake", 
				"autotools_ls", 
				"pyright", 
				"lua_ls",
			}
		})
	end	
}
