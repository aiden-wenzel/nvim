return {
	"neovim/nvim-lspconfig",
	dependencies = {
		'neovim/nvim-lspconfig',
		"hrsh7th/nvim-cmp",
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
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

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
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
			mappings = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
               			{ name = 'luasnip' },
				{ name = 'buffer' },
			}),
		})


	end
}
