return {
	{
		"mbbill/undotree",
		event = { "BufReadPost" },
		lazy = true,
		config = function()
			if vim.fn.has("persistent_undo") == 1 then
				local target_path = vim.fn.expand("~/.config/nvim/.undodir")
				vim.opt.undodir = target_path
				vim.opt.undofile = true

				local keymap = vim.keymap
				keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "[U]undotree [T]oggle" })
			end
		end,
	},
}
