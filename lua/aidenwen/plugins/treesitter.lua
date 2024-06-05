return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"c", "cpp", "python", "lua"},
            ignore_install = { "latex" },
			highlight = {
				enable = true,
                disable = {"latex"},
				additional_vim_regex_highlighting = false
			}
		})
	end
}
