local chezmoi_path = vim.fn.expand("~/.local/share/chezmoi/*")

return {
	"404ALegend/cz.nvim",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
	keys = {
		{
			"<leader>cz",
			function()
				require("chezmoi.pick").snacks()
			end,
			desc = "Chezmoi files",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = chezmoi_path,
			callback = function(ev)
				local bufnr = ev.buf

				require("lazy").load({ plugins = { "chezmoi.nvim" } })
				vim.schedule(function()
					require("chezmoi.commands.__edit").watch(bufnr)
				end)
			end,
		})
	end,
	config = function()
		require("chezmoi").setup({
			edit = {
				watch = true,
				force = false,
			},
			notification = {
				on_open = true,
				on_apply = true,
				on_watch = false,
			},
		})
	end,
}
