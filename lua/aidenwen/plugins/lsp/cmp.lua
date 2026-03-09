return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			window = {
				---completion = cmp.config.window.bordered(),
				---documentation = cmp.config.window.bordered(),
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
				{name = 'nvim_lsp', max_item_count = 5},
				{name = 'nvim_lsp_signature_help', max_item_count = 5},
				-- {name = 'buffer'}
			})
		})
	end
}
