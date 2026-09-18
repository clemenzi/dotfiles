return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		enabled = not vim.g.vscode,
		opts = { preset = "helix" },
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
