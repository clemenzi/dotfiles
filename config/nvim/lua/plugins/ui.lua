return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
		enabled = not vim.g.vscode,
		opts = { preset = "helix" },
		config = function(_, opts)
			require("which-key").setup(opts)
			vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "TelescopeNormal" })
			vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "TelescopeBorder" })
			vim.api.nvim_set_hl(0, "WhichKeyTitle", { link = "TelescopeTitle" })
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
