# dotfiles

I got tired of distro-hopping and starting from scratch each time, so I've made some dotfiles and scripts to automate the tedious stuff.

This repo is currently specific to Arch-based linux distributions. I intend to modify it at a later date to support MacOS, and maybe Debian based distros. Don't hold your breath though ;)

The script files in this repo have been *heavily inspired* by [Lissy93/dotfiles](https://github.com/Lissy93/dotfiles), credit goes to her awesome dotfiles!

## Contents
In addition to a custom zsh terminal shell config, this repo also contains configurations for the following tools:
- nvim (Most of which has come directly from [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), with some additional config overrides and plugins that I have added.)
- i3 (window manager, main things that I have changed is the navigation to match vim bindings, as well as moving the i3bar to the top, there is no ricing applied (yet)).


Added custom nvim lua config (WIP), note that when you install a new plugin, you need to first declare it in the plugins.lua file, then if any additional config is required, add a 'plugin-name'.lua file in the 'plugin_config/' directory.
To install plugins, run :PackerSync command

To show file icons in nerd-tree, you'll need to install a custom font [found here](https://www.nerdfonts.com/font-downloads)
