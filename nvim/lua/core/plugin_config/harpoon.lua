local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<C-e>m", function()
	harpoon:list():add()
end, { desc = "Mark a file to be a tab" })

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "List all marked tabs" })

vim.keymap.set("n", "<C-e>h", function()
	harpoon:list():select(1)
end, { desc = "Switch to 1" })

vim.keymap.set("n", "<C-e>j", function()
	harpoon:list():select(2)
end, { desc = "Switch to 2" })

vim.keymap.set("n", "<C-e>k", function()
	harpoon:list():select(3)
end, { desc = "Switch to 3" })

vim.keymap.set("n", "<C-e>l", function()
	harpoon:list():select(4)
end, { desc = "Switch to 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<s-tab>", function()
	harpoon:list():prev()
end, { desc = "Switch to previous tab" })
vim.keymap.set("n", "<tab>", function()
	harpoon:list():next()
end, { desc = "Switch to next tab" })
