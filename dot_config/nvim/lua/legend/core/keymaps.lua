-- Leader set to "Space"
vim.g.mapleader = " "

local k = vim.keymap.set -- for simplicity
local opts = { noremap = true, silent = true }
-- General Keymaps

-- Use jk to exit insert mode
k("i", "jk", "<ESC>", { desc = "Exit Insert mode with jk" })

-- Save/quit
k("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite" })
k("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit" })
k("n", "<leader>z", "<cmd>wq<CR>", { desc = "[W]rite [Q]uit all" })

-- Delete single character without copying into register
k("n", "x", '"_x')

-- Remove highlights
k("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Increment/decrement numbers
k("n", "<leader>+", "<C-a>", { desc = "[+] number" }) -- increment
k("n", "<leader>-", "<C-x>", { desc = "[-] number" }) -- decrement

-- Code Navigation
-- Center the cursor after scrolling and searching commands
k("n", "<C-u>", "<C-u>zz", opts)
k("n", "<C-d>", "<C-d>zz", opts)
k("n", "{", "{zz", opts)
k("n", "}", "}zz", opts)
k("n", "N", "Nzz", opts)
k("n", "n", "nzz", opts)
k("n", "G", "Gzz", opts)
k("n", "gg", "ggzz", opts)
k("n", "gd", "gdzz", opts)
k("n", "<C-i>", "<C-i>zz", opts)
k("n", "<C-o>", "<C-o>zz", opts)
k("n", "%", "%zz", opts)
k("n", "*", "*zz", opts)
k("n", "#", "#zz", opts)

-- Window Remaps
-- Window Management
k("n", "<leader>dv", "<C-w>v", { desc = "[D]ivide window [V]ertically" }) -- split window vertically
k("n", "<leader>dh", "<C-w>s", { desc = "[D]ivide window [H]orizontally" }) -- split window horizontally
k("n", "<leader>de", "<C-w>=", { desc = "[D]ivide windows [E]qually" }) -- make split windows equal width & height
k("n", "<leader>dx", "<cmd>close<CR>", { desc = "[D]elete [X] current split" }) -- close current split window

-- Window Navigation
k("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the [h]left window" })
k("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the [l]right window" })
k("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the [j]lower window" })
k("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the [k]upper window" })

-- Tab management
k("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[T]ab [O]pen" }) -- open new tab
k("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab [X] current tab" }) -- close current tab
k("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[T]ab [N]ext" }) --  go to next tab
k("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[T]ab [P]revious" }) --  go to previous tab
k("n", "<leader>ts", "<cmd>tabnew %<CR>", { desc = "[T]ab [S]ource file into new tab" }) --  move current buffer to new tab

-- Text Manipulation
-- Move selected text up and down in Visual mode
k("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
k("x", "<A-k>", ":m '>-2<CR>gv=gv", opts)

-- Indent and outdent selected text in Visual mode
k("x", "<<", [[:lua vim.cmd("normal! <<") vim.cmd("normal! gv")<CR>]], opts)
k("x", ">>", [[:lua vim.cmd("normal! >>") vim.cmd("normal! gv")<CR>]], opts)

-- Lazy UI
k("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "[L]azy" })
