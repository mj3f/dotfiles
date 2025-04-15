-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
-- vim.o.colorcolumn = "80"
vim.g.mapleader = " "

-- Custom keymappings
local keymap = vim.keymap

-- Remap escape key for insert and visual modes.
keymap.set("i", "jk", "<ESC>", { silent = true })
keymap.set("v", "jk", "<ESC>", { silent = true })

-- window manageme
keymap.set("n", "sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "ss", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "sq", "<cmd>close<CR>", { desc = "Close current split" })
-- Navigate windows
keymap.set("n", "s", "<Nop>", { silent = true }) -- disables default nvim 's' mapping which changes line
keymap.set("n", "sh", "<C-w>h", { desc = "Moves to left window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Moves to down window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Moves to up window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Moves to right window" })
keymap.set("n", "s<left>", "<C-w><", { desc = "Resize window to left" })
keymap.set("n", "s<right>", "<C-w>>", { desc = "Resize window to right" })
keymap.set("n", "s<up>", "<C-w>+", { desc = "Resize window upwards" })
keymap.set("n", "s<down>", "<C-w>-", { desc = "Resize window downwards" })
