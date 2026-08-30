return {
	{
		"folke/sidekick.nvim",
		enabled = not vim.g.vscode,
		event = "InsertEnter",
		opts = {},
		keys = {
			{
				"<tab>",
				function()
					if not require("sidekick").nes_jump_or_apply() then
						return "<Tab>"
					end
				end,
				expr = true,
				desc = "Goto/apply next edit suggestion",
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = not vim.g.vscode,
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		enabled = not vim.g.vscode,
		event = "InsertEnter",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = not vim.g.vscode,
		build = ":TSUpdate",
		event = "BufRead",
		opts = {},
	},
}
