-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- Remap escape key for insert and visual modes.
keymap.set("i", "jk", "<ESC>", { silent = true })
keymap.set("v", "jk", "<ESC>", { silent = true })

-- window management
keymap.set("n", "s", "<Nop>", { silent = true }) -- disables default nvim 's' mapping which changes line
keymap.set("n", "sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "ss", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "sq", "<cmd>close<CR>", { desc = "Close current split" })
-- Navigate windows
keymap.set("n", "sh", "<C-w>h", { desc = "Moves to left window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Moves to down window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Moves to up window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Moves to right window" })
keymap.set("n", "s<left>", "<C-w><", { desc = "Resize window to left" })
keymap.set("n", "s<right>", "<C-w>>", { desc = "Resize window to right" })
keymap.set("n", "s<up>", "<C-w>+", { desc = "Resize window upwards" })
keymap.set("n", "s<down>", "<C-w>-", { desc = "Resize window downwards" })
