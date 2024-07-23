-- Purpose: Make brackets autoclose.

return {
	'windwp/nvim-autopairs',
	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		local autopair = require("nvim-autopairs")
		local autotag = require("nvim-ts-autotag")

		autopair.setup({

		})

		autotag.setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false
			},
		})
	end
}
