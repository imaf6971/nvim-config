vim.cmd [[packad packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	
	use 'ms-jpq/chadtree'
end)
