return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		enabled = not vim.g.vscode,
		opts = { preset = "helix" },
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function(_, opts)
			require("which-key").setup(opts)
		end,
	},
	{
		"sainnhe/sonokai",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("sonokai")
		end,
	},
}
