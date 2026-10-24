return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<CMD>Oil --float<CR>", desc = "Open parent directory" },
	},
	opts = {
		columns = { "icon" },
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			border = "rounded",
			padding = 5,
		},
		keymaps = {
			["q"] = { "actions.close", mode = "n" },
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}
