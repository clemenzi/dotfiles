return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		init = function()
			local arg = vim.fn.argv(0)

			if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
				require("lazy").load({ plugins = { "oil.nvim" } })
			end
		end,

		opts = {
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,

			view_options = {
				show_hidden = true,
			},

			keymaps = {
				["<Esc><Esc>"] = "actions.close",
				["<leader>e"] = "actions.parent",
			},

			float = {
				max_width = 0.7,
				max_height = 0.8,
				border = "rounded",
				preview_split = "right",
				win_options = {
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,FloatTitle:FloatTitle",
				},
			},

			preview_win = {
				win_options = {
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,FloatTitle:FloatTitle",
				},
			},

			confirmation = {
				border = "rounded",
				win_options = {
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,FloatTitle:FloatTitle",
				},
			},
		},

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		keys = {
			{
				"<leader>e",
				"<cmd>Oil --float --preview<cr>",
				desc = "Open parent directory",
			},
		},
	},
	{
		"dmtrKovalenko/fff",
		enabled = not vim.g.vscode,
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		opts = {
			layout = {
				width = 0.7,
				height = 0.8,
				prompt_position = "top",
			},
		},
		lazy = false,
		keys = {
			{
				"<leader>ff",
				function()
					require("fff").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("fff").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fs",
				function()
					require("fff").live_grep_under_cursor()
				end,
				mode = { "n", "x" },
				desc = "Search Word / Selection",
			},
		},
	},
	{
		"folke/flash.nvim",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
