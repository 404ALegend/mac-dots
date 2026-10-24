return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "[H]arpoon buffer [1]",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "[H]arpoon buffer [2]",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "[H]arpoon buffer [3]",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "[H]arpoon buffer [4]",
		},
		{
			"<a-1>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon next buffer",
		},
		{
			"<a-2>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon prev buffer",
		},
		{
			"<leader>h",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "[H]arpoon Toggle Menu",
		},
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "[H]arpoon [A]dd",
		},
		{
			"<leader>hs",
			function()
				local harpoon = require("harpoon")
				local file_paths = {}

				for _, item in ipairs(harpoon:list().items) do
					table.insert(file_paths, item.value)
				end

				vim.ui.select(file_paths, { prompt = "Harpoon" }, function(choice)
					if choice then
						vim.cmd.edit(vim.fn.fnameescape(choice))
					end
				end)
			end,
			desc = "[H]arpoon [S]earch",
		},
	},
	opts = {
		save_on_toggle = false,
		sync_on_ui_close = false,
		save_on_change = true,
		enter_on_sendcmd = false,
		tmux_autoclose_windows = false,
		excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
		mark_branch = false,
		key = function()
			return vim.uv.cwd()
		end,
	},
	config = function(_, opts)
		require("harpoon").setup(opts)
	end,
}
