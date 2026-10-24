local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.laststatus = 3

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Stop highlighting search results when searching is completed
opt.hlsearch = false

-- 'O' does not open a new line with a comment
opt.formatoptions:remove("o")

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Backspace
opt.backspace = "indent,eol,start"

-- Swapfile
opt.swapfile = false

-- Disable horizontol scrolling
opt.mousescroll = "ver:1,hor:0"

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Mise
-- vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Filetypes
-- vim.cmd("autocmd BufRead,BufNewFile *.hbs set filetype=html")
