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
				"codelldb",
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
				"ts_ls",
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

		local opts = {noremap = true, silent = true}
		vim.api.nvim_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

		lspconfig.verible.setup{
			cmd = {'verible-verilog-ls', '--rules_config_search'},
		}

	end
}
