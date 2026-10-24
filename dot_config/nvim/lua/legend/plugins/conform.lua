return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>fc",
			mode = { "n", "v" },
			function()
				require("conform").format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				})
			end,
			desc = "[F]ormat [C]ode",
		},
		{
			"<leader>mp",
			mode = { "n", "v" },
			function()
				require("conform").format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				})
			end,
			desc = "Format file or range",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				go = { "goimports", "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
			},
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
