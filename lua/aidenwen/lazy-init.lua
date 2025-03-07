-- Purpose: Initialize the lazy plugin manager.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{import = "aidenwen.plugins.lsp"},
		{import = "aidenwen.plugins.appearence"},
		{import = "aidenwen.plugins.navigation"},
		{import = "aidenwen.plugins.source-control"},
	},
	change_detection = {
		enabled = true,
		notify = false,
	}
})
