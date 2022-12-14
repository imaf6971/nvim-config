vim.cmd [[packad packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'ms-jpq/chadtree'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('plugins.treesitter')
		end
	}
	use { 'catppuccin/nvim', as = 'catppuccin' }
end)
