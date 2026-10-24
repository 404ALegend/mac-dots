return {
	"folke/noice.nvim",
	event = "VeryLazy",
	cmd = {
		"Noice",
		"NoiceAll",
		"NoiceDismiss",
		"NoiceErrors",
		"NoiceHistory",
		"NoiceLast",
		"NoicePick",
	},
	opts = {
		-- Defaults
		presets = {
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{ "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "[N]oice [D]ismiss" },
	},
	config = function(_, opts)
		require("noice").setup(opts)

		if Snacks and Snacks.picker then
			Snacks.picker.sources.noice = require("noice.integrations.snacks").source
		end
	end,
}
