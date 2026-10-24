return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = { enabled = true },
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		if package.loaded["noice"] then
			Snacks.picker.sources.noice = require("noice.integrations.snacks").source
		end
	end,

	keys = {
		{ "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Find existing buffers" },
		{ "<leader>/", function() Snacks.picker.lines() end, desc = "[/] Fuzzy search in current buffer" },
		{ "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "[S]earch [/] in open files" },
		{ "<leader>s.", function() Snacks.picker.recent() end, desc = "[S]earch Recent Files" },
		{ "<leader>sa", function() vim.cmd("Noice pick") end, desc = "[S]earch [A]lerts" },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "[S]earch [C]ommand history" },
		{ "<leader>sd", function() Snacks.picker.lsp_symbols() end, desc = "[S]earch [D]ocument Symbols" },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "[S]earch Buffer [D]iagnostics" },
		{ "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
		{ "<leader>si", function() Snacks.picker.lsp_implementations() end, desc = "[S]earch [I]mplementation" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
		{ "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config"), title = "Neovim Files" }) end, desc = "[S]earch [N]eovim files" },
		{ "<leader>sp", function() Snacks.picker.git_files() end, desc = "[S]earch [P]roject files" },
		{ "<leader>sr", function() Snacks.picker.lsp_references() end, desc = "[S]earch [R]eferences" },
		{ "<leader>sR", function() Snacks.picker.resume() end, desc = "[S]earch [R]esume" },
		{ "<leader>ss", function() Snacks.picker() end, desc = "[S]earch [S]elect picker" },
		{ "<leader>st", "<cmd>TodoQuickFix<cr>", desc = "[S]earch [T]odos" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, mode = { "n", "x" }, desc = "[S]earch current [W]ord" },
		{ "<leader>sx", function() Snacks.picker.diagnostics() end, desc = "[S]earch [X]diagnostics" },
	},
}
