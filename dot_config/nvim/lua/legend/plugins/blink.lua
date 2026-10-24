return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = "rafamadriz/friendly-snippets",

	version = "v0.*",

	opts = {
		keymap = {
			preset = "enter",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
		},

		completion = {
			menu = {
				border = {
					{ "󱐋", "WarningMsg" },
					{ "─", "Comment" },
					{ "╮", "Comment" },
					{ "│", "Comment" },
					{ "╯", "Comment" },
					{ "─", "Comment" },
					{ "╰", "Comment" },
					{ "│", "Comment" },
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = {
						{ "", "DiagnosticHint" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
				},
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		signature = { enabled = true, window = {
			border = "rounded",
		} },
	},
	opts_extend = { "sources.default" },
}
