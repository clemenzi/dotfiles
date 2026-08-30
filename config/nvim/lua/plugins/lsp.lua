return {
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = not vim.g.vscode,
		event = "BufRead",
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = {
			{
				"mason-org/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
				opts = { registry_cache = { refresh = false } },
			},
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		keys = {
			{
				"<leader>lf",
				function()
					vim.lsp.buf.format()
				end,
				desc = "Format file",
			},
			{ "<leader>fld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
			{ "<leader>flr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "<leader>fli", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
			{ "<leader>flt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type definitions" },
			{ "<leader>fls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
			{ "<leader>flw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
		},
		opts = {
			ensure_installed = { "lua_ls" },
			automatic_enable = true,
		},
		config = function(_, opts)
			vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("config-lsp", { clear = true }),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, args.buf, { auto_trigger = true })
					end
					if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, args.buf) then
						vim.lsp.inline_completion.enable(true, { bufnr = args.buf })
					end
				end,
			})
			require("mason-lspconfig").setup(opts)
		end,
	},
}
