-- Purpose: Set the theme for neovim as well as customize the status line.

return {
	"EdenEast/nightfox.nvim",
	"catppuccin/nvim",
	"sainnhe/sonokai",

	config = function()
		vim.cmd("colorscheme carbonfox")
	end
}
