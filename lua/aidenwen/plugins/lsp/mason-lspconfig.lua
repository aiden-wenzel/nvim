-- Purpose: Install and setup language servers.

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason.setup()

		mason_tool_installer.setup({
			ensure_installed = {
				"pylint",
			}
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"clangd",
				"cmake",
				"html",
				"cssls",
				"tsserver",
			},

			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities
					})
				end,

				["lua_ls"] = function ()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {version = "Lua 5.1"},
								diagnostics = {
									globals = {"vim", "it", "describe", "before_each", "after_each"},
								}
							}
						}
					})
				end
			}
		})
	end
}
