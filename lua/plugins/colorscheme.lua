return {
	{
		"sainnhe/everforest",
		priority = 1000,
		enabled = true,
		config = function()
			vim.cmd.colorscheme "everforest"
		end
	}, 
    { 
		"Mofiqul/vscode.nvim",
		enabled = false,
		config = function()
			vim.cmd.colorscheme "vscode"
		end 
	},
}
