-- Set theme for lua line to match gruvbox, and enable icons
local config = require("lualine")

config.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
	},
	sections = {
		lualine_a = { -- Show full path of file in lualine
			{
				"filename",
				path = 1,
			},
		},
	},
})
