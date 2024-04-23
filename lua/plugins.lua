return require('packer').startup(function()
    use {'wbthomason/packer.nvim'}
    use { "ellisonleao/gruvbox.nvim" }
    use {'nvim-treesitter/nvim-treesitter', rn = ':TSUpdate'}
    use {'nvim-telescope/telescope.nvim', 
			tag = '0.1.6', 
			requires = {'nvim-lua/plenary.nvim'}
	}
	use {
		'lewis6991/gitsigns.nvim',
		 requires = {
		'nvim-lua/plenary.nvim'
	  },
		config = function()
		require('gitsigns').setup()
		end
	}
end)

