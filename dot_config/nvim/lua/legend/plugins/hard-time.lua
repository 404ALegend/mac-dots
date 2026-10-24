return {
	"m4xshen/hardtime.nvim",
	cmd = "Hardtime",
	keys = {
		{ "<leader>ht", "<cmd>Hardtime toggle<cr>", desc = "[H]ard [T]ime toggle" },
	},
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		max_count = 10,
		restriction_mode = "hint",
		disabled_keys = {
			["<Up>"] = {},
			["<Down>"] = {},
		},
	},
}
