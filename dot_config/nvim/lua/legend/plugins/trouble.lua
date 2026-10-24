return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open/close [X]Trouble list" },
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open [X]Trouble [W]orkspace diagnostics" },
		{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open [X]Trouble document diagnostics" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Open [X]Trouble [Q]uickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open [X]Trouble [L]ocation list" },
		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open [T]odos in [X]Trouble" },
	},
}
