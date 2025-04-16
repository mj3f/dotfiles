local config = require('nvim-treesitter.configs')

config.setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 
    "c",
    "lua",
    "vim",
    "html",
    "css",
    "c_sharp",
    "dockerfile",
    "javascript",
    "markdown",
    "markdown_inline",
    "python",
    "terraform",
    "tsx",
    "typescript",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },

  indent = {
    enable = true,
  }
})
