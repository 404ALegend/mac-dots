return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
	keys = {
		{ "<leader>M", "<cmd>Mason<cr>", desc = "[M]ason" },
	},
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer" },
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"cssls",
				"elixirls",
				"gopls",
				"html",
				"lua_ls",
				"pyright",
				"sqls",
				"tailwindcss",
				"ts_ls",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"goimports",
				"isort",
				"prettier",
				"pyright",
				"stylua",
				"yamllint",
				"yamlfmt",
			},
		})
	end,
}
