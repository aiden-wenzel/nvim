return { 
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	--	"hrsh7th/cmp-nvim-lsp",
	--	"hrsh7th/cmp-buffer",
	--	"hrsh7th/cmp-path",
	--	"hrsh7th/cmp-cmdline",
	--	"hrsh7th/nvim-cmp",
	--	"L3MON4D3/LuaSnip",
	--	"saadparwaiz1/cmp_luasnip",
	--	"j-hui/fidget.nvim",
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


