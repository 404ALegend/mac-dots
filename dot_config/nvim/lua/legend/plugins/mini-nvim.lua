return {
	"echasnovski/mini.nvim",
	event = { "BufReadPost", "BufNewFile", "InsertEnter" },
	keys = {
		{ "gc", mode = { "n", "x" }, desc = "Comment" },
		{ "gcc", mode = "n", desc = "Comment line" },
		{ "sa", mode = { "n", "x" }, desc = "Add surrounding" },
		{ "sd", mode = "n", desc = "Delete surrounding" },
		{ "sr", mode = "n", desc = "Replace surrounding" },
		{ "sf", mode = "n", desc = "Find right surrounding" },
		{ "sF", mode = "n", desc = "Find left surrounding" },
		{ "sh", mode = "n", desc = "Highlight surrounding" },
	},
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.bracketed").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup({
			mappings = {
				left = "<C-h>",
				right = "<C-l>",
				down = "<C-j>",
				up = "<C-k>",

				-- Normal mode keybinds
				line_left = "<C-h>",
				line_right = "<C-l>",
				line_down = "<C-j>",
				line_up = "<C-k>",
			},
		})
		require("mini.pairs").setup()
		require("mini.surround").setup({ n_lines = 500 })
	end,
}
