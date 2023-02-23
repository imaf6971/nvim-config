require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "go", "lua", "typescript", "rust", "markdown", "markdown_inline" },
	sync_install = false,

	auto_install = true,
	
	highlight = {
		enable = true,
	},
}
