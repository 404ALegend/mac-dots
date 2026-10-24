return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			component_separators = { left = " ", right = " " },
			section_separators = { left = " ", right = " " },
			theme = "auto",
			disabled_filetypes = { statusline = { "dashboard", "alpha" } },
		},
		tabline = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "tabs" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"diagnostics",
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = "󰝶 ",
					},
				},
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{ "filename", padding = { left = 1, right = 0 } },
				{ "diff" },
			},
			lualine_x = {
				{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
			},
			lualine_y = {
				"location",
			},
			lualine_z = {
				{
					"progress",
				},
			},
		},

		extensions = { "oil", "lazy", "mason", "trouble" },
	},
}
