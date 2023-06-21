require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "angularls",
    -- "csharp_ls", -- doesn't work
    "omnisharp", -- alternative csharp lsp for .NET 6
    "cssls",
    "dockerls",
    "eslint",
    "jsonls",
    "tsserver",
    "pyright",
    "tailwindcss",
    "terraformls",
  }
})

-- refer to the mason-lspconfig README for more info https://github.com/williamboman/mason-lspconfig.nvim/blob/main/README.md
-- In short, once an lsp for a lanuage is installed in 'ensure_installed', you need to add configuration for it below...
require("lspconfig").lua_ls.setup {}
require("lspconfig").angularls.setup {}
require("lspconfig").csharp_ls.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").tailwindcss.setup {}
require("lspconfig").terraformls.setup {}
require("lspconfig").omnisharp.setup {}

-- Once lspconfig added, save, quit, re-open vim, run :Mason command to install new dependencies added.
