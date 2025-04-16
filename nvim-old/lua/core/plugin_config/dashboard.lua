
local config = require("dashboard")

local logo = [[
 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
 ]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

config.setup({
  theme = 'doom',
  config = {
    header = vim.split(logo, "\n"),
    center = {
      { 
        icon = " ", 
        desc = " New File",
        key = "n",
        action = "ene | startinsert",
      },
      {
        icon = ' ',
        desc = 'Find File',
        key = 'f',
        action = 'Telescope find_files'
      },
      { 
        icon = " ",
        desc = " Recent files",   
        key = "r",
        action = "Telescope oldfiles",                                   
      },
      { 
        icon = " ", 
        desc = " Find text", 
        key = "g",
        action = "Telescope live_grep",
      },    
      { 
        icon = "󰒲 ",
        desc = "Open Lazy",
        key = "l",
        action = "Lazy",
      },
      { 
        icon = " ", 
        desc = "Quit",            
        key = "q",
        action = function() vim.api.nvim_input("<cmd>qa<cr>") end, 
      },
    },
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
  }
})