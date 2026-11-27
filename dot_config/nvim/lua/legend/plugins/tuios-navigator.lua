return {
	"Tim4c/tuios-nvim-navigator",
	enabled = vim.env.TUIOS_ENV == "1",
	lazy = false,
	opts = {
		keymaps = {
			left = "<C-h>",
			down = "<C-j>",
			up = "<C-k>",
			right = "<C-l>",
		},
	},
}
