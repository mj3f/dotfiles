require("gitblame").setup()

vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "toggle git blame" })

