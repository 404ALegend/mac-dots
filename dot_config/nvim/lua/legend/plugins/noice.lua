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
			local source = require("noice.integrations.snacks").source
			local find = source.find

			source.find = function()
				local items = find()
				for _, item in ipairs(items) do
					local message = require("noice.text.format").format(item.message, "details")
					item.data = table.concat(vim.tbl_map(function(line) return line:content() end, message._lines), "\\n")
				end
				return items
			end

		end
	end,
}
