# dotfiles

I got tired of distro-hopping and starting from scratch each time, so I've made some dotfiles and scripts to automate the tedious stuff.

This repo is currently specific to Arch-based linux distributions. I intend to modify it at a later date to support MacOS, and maybe Debian based distros. Don't hold your breath though ;)

The script files in this repo have been *heavily inspired* by [Lissy93/dotfiles](https://github.com/Lissy93/dotfiles), credit goes to her awesome dotfiles!

## Contents
In addition to a custom zsh terminal shell config, this repo also contains configurations for the following tools:
- nvim
- i3 (window manager, main things that I have changed is the navigation to match vim bindings, as well as moving the i3bar to the top, there is no ricing applied (yet)).


Added custom nvim lua config (WIP), note that when you install a new plugin, you need to first declare it in the plugins.lua file, then if any additional config is required, add a 'plugin-name'.lua file in the 'plugin_config/' directory.
To install plugins, run :PackerSync command

To show file icons in nerd-tree, you'll need to install a custom font [found here](https://www.nerdfonts.com/font-downloads)

## Installation
- Copy the nvim files from here to ~/.config/nvim on Linux/OSX and in C:/Users/{user}/AppData/Local/nvim on Windows
- Install a patched font from [nerd fonts](https://www.nerdfonts.com/font-downloads) (i.e. JetbrainsMono or FiraMono Nerd Font)
    - In Arch, it's as easy as using the AUR, see the nerd fonts repo for how to do that. On OSX you can download the font(s) via homebrew. On Windows you can install the fonts either manually or via the unofficial choco package.
- Run `nvim` for the first time, this will install all the required packages. You'll also need to run the `:PackerSync` command.
- For windows, you may need to install a C compiler. A guide can be found [here](https://www.github.com/nvim-treesitter/wiki/Windows-support). Easiest way to do this is to install the 'Mingw' toolchain via `choco install mingw`. Then in `lua/core/plugin_config/treesitter.lua`, change the 'gcc' parser to 'c'.
- Run nvim again to install the new C parser if running on Windows.
