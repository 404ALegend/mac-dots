local chezmoi_path = vim.fn.expand("~/.local/share/chezmoi/*")
local personal_chezmoi_source = vim.fn.expand("~/.local/share/chezmoi-personal")
local personal_chezmoi_path = personal_chezmoi_source .. "/**"

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

		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = personal_chezmoi_path,
			callback = function(ev)
				local bufnr = ev.buf
				if vim.b[bufnr].chezmoi_personal_apply_handler then
					return
				end

				vim.b[bufnr].chezmoi_personal_apply_handler = true
				local source_file = ev.file
				vim.api.nvim_create_autocmd("BufWritePost", {
					buffer = bufnr,
					callback = function()
						vim.system({
							"chezmoi",
							"apply",
							"--source-path",
							source_file,
							"--source",
							personal_chezmoi_source,
						}, function(result)
							if result.code ~= 0 then
								vim.notify(result.stderr, vim.log.levels.ERROR)
							end
						end)
					end,
				})
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
