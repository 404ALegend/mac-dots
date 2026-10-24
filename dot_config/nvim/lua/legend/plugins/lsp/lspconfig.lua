return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local keymap = vim.keymap
		local function snacks_picker(method)
			return function()
				require("lazy").load({ plugins = { "snacks.nvim" } })
				Snacks.picker[method]()
			end
		end


		-- Misc config
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- Set Keybinds

				-- Show References
				opts.desc = "[G]o to LSP [R]eference"
				keymap.set("n", "gr", snacks_picker("lsp_references"), opts)

				-- Show Declarations
				opts.desc = "[G]o to [D]eclaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				-- Show LSP Definitions
				opts.desc = "[G]o to [D]efinition"
				keymap.set("n", "gd", snacks_picker("lsp_definitions"), opts)

				-- Show LSP implementations
				opts.desc = "[G]o to [I]implementation"
				keymap.set("n", "gi", snacks_picker("lsp_implementations"), opts)

				-- show lsp type definitions
				opts.desc = "[G]o to [T]ype definitions"
				keymap.set("n", "gt", snacks_picker("lsp_type_definitions"), opts)

				-- Show possible Code Actions
				opts.desc = "[C]ode [A]ctions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				--Smart Rename
				opts.desc = "[R]e[N]ame"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- show  diagnostics for file
				opts.desc = " Buffer [D]iagnostics"
				keymap.set("n", "<leader>D", snacks_picker("diagnostics_buffer"), opts)

				-- show diagnostics for line
				opts.desc = "Show in-line [d]iagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				-- Jump to Previous Diagnostic in buffer
				opts.desc = "Go to '[' previous [d]iagnostic"
				-- keymap.set("n", "[d", vim.diagnostic.jump, { count = -1 })

				-- Jump to Next Diagnostic in buffer
				opts.desc = "Go to next ']' [d]iagnostic"
				-- keymap.set("n", "]d", vim.diagnostic.jump, { count = 1 })

				-- show documentation for what is under cursor
				opts.desc = "Show documentation under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				-- Quick keymap for restartings LSPs
				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					-- handlers = handlers,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					-- handlers = handlers,
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize globals
							diagnostics = {
								globals = { "vim", "hs", "spoon" },
							},
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								library = {
									vim.fn.expand("$HOME/.hammerspoon/Spoons/EmmyLua.spoon/annotations"),
								},
							},
						},
					},
				})
			end,
		})
	end,
}
