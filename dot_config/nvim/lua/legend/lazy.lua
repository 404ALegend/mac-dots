local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "legend.plugins" }, { import = "legend.plugins.lsp" } }, {
	defaults = {
		lazy = true,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	install = {
		missing = true,
		colorscheme = { "catppuccin" },
	},
	ui = {
		title = " lazy.nvim 💤",
		border = "rounded",
	},
	change_detection = {
		notify = false,
	},
	rocks = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"netrwPlugin",
				"tutor",
			},
		},
	},
})
