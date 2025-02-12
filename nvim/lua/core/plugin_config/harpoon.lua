local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>hm", function()
	harpoon:list():add()
end, { desc = "Mark a file to be a tab" })

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "List all marked tabs" })

vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end, { desc = "Switch to 1" })

vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end, { desc = "Switch to 2" })

vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end, { desc = "Switch to 3" })

vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end, { desc = "Switch to 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "Switch to previous tab" })
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "Switch to next tab" })
