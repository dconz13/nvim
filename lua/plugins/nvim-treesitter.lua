return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'main',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install {
			'python',
			'gdscript',
			'lua',
			'gitignore',
			'markdown',
			'vim',
			'yaml',
			'xml',
			'bash',
			'typescript',
			'javascript',
			'dockerfile',
			'html'
		}
	end,
}
