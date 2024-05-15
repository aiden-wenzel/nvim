return { 
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})
		require("mason-lspconfig").setup({

			ensure_installed = {
				"clangd",
				"pyright",
				"cmake",
				"lua_ls",
				"autotools_ls",
			},
			handlers = {
				function (server_name)
					require("lspconfig")[server_name].setup({})
				end,

				["lua_ls"] = function ()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }
								}
							}
						}
					}
				end,
			}
		})


	end
}


