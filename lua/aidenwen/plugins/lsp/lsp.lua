return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
	},

	config = function()
		require("mason").setup()
		vim.lsp.enable("pyright")
		vim.lsp.enable("lua_ls")
	end
}
