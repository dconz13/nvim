return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
			  		library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			  	},
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.gdscript.setup({
			name = "godot",
    		cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
		})
		lspconfig.ts_ls.setup({})

	end,
}
