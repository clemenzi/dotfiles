-- ----------------------------------------------------------
-- --- Initialization file for Neovim
-- ----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ----------------------------------------------------------
-- --- Graphical interface
-- ----------------------------------------------------------
if vim.g.neovide then
	vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h14"
end

-- ----------------------------------------------------------
-- --- Statusline
-- ----------------------------------------------------------
_G.statusline_mode = function()
	local mode = vim.fn.mode(1)
	local first = mode:sub(1, 1)

	if mode:sub(1, 2) == "no" then
		return "OPR"
	elseif first == "n" then
		return "NOR"
	elseif first == "i" then
		return "INS"
	elseif first == "v" or first == "V" or first == "\22" then
		return "VIS"
	elseif first == "s" or first == "S" or first == "\19" then
		return "SEL"
	elseif first == "R" then
		return "REP"
	elseif first == "c" then
		return "CMD"
	elseif first == "r" then
		return "PRM"
	elseif first == "!" then
		return "SHL"
	elseif first == "t" then
		return "TER"
	end

	return "UNK"
end

vim.opt.statusline = " %{v:lua.statusline_mode()} 󰇙 %f%m%r%= %y  %l:%c  %P "

-- ----------------------------------------------------------
-- --- Options
-- ----------------------------------------------------------
-- Appearance
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.showcmdloc = "statusline"

-- Text editing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("Wc")
vim.opt.undofile = true

-- Code folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "",
	foldsep = " ",
	foldinner = " ",
	foldclose = "",
}

-- ----------------------------------------------------------
-- --- Plugins
-- ----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim automatically on first launch.
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	defaults = { lazy = true },
	checker = { enabled = false },
})

-- ----------------------------------------------------------
-- --- Keymaps
-- ----------------------------------------------------------
local map = vim.keymap.set

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })
map("v", "<", "<gv", { desc = "Move selected block backwards" })
map("v", ">", ">gv", { desc = "Move selected block forwards" })

-- ----------------------------------------------------------
-- --- Autocommands
-- ----------------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Enable Tree-sitter folding only when a parser is available.
autocmd("FileType", {
	group = augroup("config-treesitter-folds", { clear = true }),
	callback = function(args)
		if not pcall(vim.treesitter.start, args.buf) then
			return
		end
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

-- Hide line numbers in terminal buffers and enter Insert mode immediately.
autocmd("TermOpen", {
	group = augroup("config-terminal", { clear = true }),
	callback = function()
		vim.w.config_terminal_number = vim.wo.number
		vim.w.config_terminal_relativenumber = vim.wo.relativenumber
		vim.wo.number = false
		vim.wo.relativenumber = false
		vim.cmd.startinsert()
	end,
})

-- Restore line numbers when leaving the terminal.
autocmd("TermLeave", {
	group = augroup("config-terminal-close", { clear = true }),
	callback = function()
		if vim.w.config_terminal_number ~= nil then
			vim.wo.number = vim.w.config_terminal_number
			vim.wo.relativenumber = vim.w.config_terminal_relativenumber
			vim.w.config_terminal_number = nil
			vim.w.config_terminal_relativenumber = nil
		end
	end,
})
