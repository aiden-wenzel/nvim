-- Purpose: Provide neovim with a history of saved changes.

return {
	"mbbill/undotree",

	config = function ()
		vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
	end
}
