# NVIM Config
Some notes on my neovim config...

The `init.lua` file located in the base directory is required for all custom nvim configs. In my case, I've modularised it such that it just imports the files that contain my actual config.

## How to use
TODO: Setup an installation script to auto-install this config.
It is assumed you already have a fresh installation of neovim.

To use this config, simply copy the contents of this directory (minus this readme file I guess) to your .config directory by running `cp -r dotfiles/nvim ~/.config` 
(this cp command may need tweaking to fit your machine but you get the idea).
Once this is done, simply run `nvim` and everything *should* install automatically.

## Adding plugins
Lazy.nvim is used as the package manager, to add a new plugin, make sure you select the lazy way.
add the plugin to the `lua/core/plugins.lua` file, under the 'plugins' table at the bottom of the file.
e.g.
``` lua
local plugins = {
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
}```

The first part is the name of the repo for the plugin in github, some plugin definitions will contain just the name, others may need to define configurations and/or dependencies.
Once the plugin has been added, if you run the `nvim` command it should automatically install the plugin. Afterwards make sure to run the vim command `:checkhealth name-of-plugin` to check the status of the installation,
and whether you need to do any other setup to it.

Lastly, you need to load the plugin in, this is done by calling `require("gruvbox").setup()`. In my setup, each plugin has it's own lua file, located in `lua/core/plugin_config`.
If a plugin requires further setup, such as tweaking its default options, you can define a local variable to easily access the plugin, e.g. `local config = require("gruvbox") \n config.setup({...{)`

The `:Lazy` vim command opens a nice TUI window to show you a list of all installed plugins, and an easy way to update them.


## Adding language support
The Mason plugin is used to manage any installed LSP (Language Server Protocol) and Linter/formatters. The TUI can be accessed by running the command `:Mason`
To add a new LSP, you need to add the name of it to the ensure_installed table located within the `lua/core/plugin_config/lsp_config.lua` file. After that is done, you need to setup the LSP
at the bottom of the file by adding
``` lua
lspconfig.cssls.setup {
  capabilities = capabilities
}
```
(capabilities is ensures that code completions for the newly added language are supported)

## Setting custom key mappings
Custom key maps are located in the `lua/core/keymaps.lua` file.
As neovim uses lua rather than vimscript, you need to use 'meta-accessors' to access the underlying vim apis.
refer to [this](https://github.com/nanotee/nvim-lua-guide?tab=readme-ov-file#using-meta-accessors) for more information.

`vim.o` or `vim.opt` are used to 'set' stuff in vim, this is used for setting general settings..
`vim.g` is similar except it's applies globally, rather than at the buffer level. This is usually used to set values for settings used by the plugins you import.

Here's a good [guide](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/) on lua and its use in neovim for future reference.
