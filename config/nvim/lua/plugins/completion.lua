return {
	{
		"folke/lazydev.nvim",
		enabled = not vim.g.vscode,
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		enabled = not vim.g.vscode,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "InsertEnter",
		version = "*",
		opts = {
			keymap = {
				preset = "super-tab",
				["<CR>"] = { "select_and_accept", "fallback" },
				["<Tab>"] = {
					"snippet_forward",
					function()
						if require("sidekick").nes_jump_or_apply() then
							return true
						end
						if vim.lsp.inline_completion.get() then
							return true
						end
					end,
					"fallback",
				},
			},
			completion = {
				documentation = { auto_show = true },
			},
			signature = { enabled = true },
			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
