-- Purpose: Add autocomplete engine.
return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",

		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

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

			mapping = cmp.mapping.preset.insert({
				-- Scroll up in the completion list with Tab
				['<Tab>'] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Insert,
				}),

				-- Scroll down in the completion list with Shift+Tab
				['<S-Tab>'] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Insert,
				}),

				-- Accept completion item with <CR>
				['<CR>'] = cmp.mapping.confirm({
					select = true,  -- Ensure that <CR> always selects the item
				}),

				-- Optional: Prevent default behavior when pressing <Tab> or <CR>
				-- so they can be mapped freely
				['<C-Space>'] = cmp.mapping.complete(),
				-- You can add more custom mappings as per your needs
		}),

			sources = cmp.config.sources({
				{name = 'nvim_lsp'},
				{name = 'luasnip'},
				{name = 'nvim_lsp_signature_help'},
				-- {name = 'buffer'}
			})
		})
		vim.diagnostic.config({
			virtual_text = true,

			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end
}
