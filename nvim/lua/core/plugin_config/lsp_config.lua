require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "angularls",
    "dockerls",
    "eslint",
    "jsonls",
    "ts_ls",
    "pyright",
    "tailwindcss",
    "terraformls",
    "gopls",
    "html",
    "cssls"
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- refer to the mason-lspconfig README for more info https://github.com/williamboman/mason-lspconfig.nvim/blob/main/README.md
-- In short, once an lsp for a lanuage is installed in 'ensure_installed', you need to add configuration for it below...
require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}
require("lspconfig").angularls.setup {
  capabilities = capabilities
}
require("lspconfig").cssls.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").ts_ls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").tailwindcss.setup {}
require("lspconfig").terraformls.setup {}
require("lspconfig").gopls.setup {}

-- Once lspconfig added, save, quit, re-open vim, run :Mason command to install new dependencies added.
--

