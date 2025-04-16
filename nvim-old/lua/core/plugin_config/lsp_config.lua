require("mason").setup()

local masonconfig = require("mason-lspconfig")

masonconfig.setup({
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
    "html",
    "cssls"
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- refer to the mason-lspconfig README for more info https://github.com/williamboman/mason-lspconfig.nvim/blob/main/README.md
-- In short, once an lsp for a lanuage is installed in 'ensure_installed', you need to add configuration for it below...

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  capabilities = capabilities,
}

lspconfig.angularls.setup {
  capabilities = capabilities
}

lspconfig.cssls.setup {
  capabilities = capabilities
}

lspconfig.dockerls.setup {
  capabilities = capabilities
}

lspconfig.eslint.setup {
  capabilities = capabilities
}

lspconfig.jsonls.setup {
  capabilities = capabilities
}

lspconfig.ts_ls.setup {
  capabilities = capabilities
}

lspconfig.pyright.setup {
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities
}

lspconfig.terraformls.setup {
  capabilities = capabilities
}

-- Once lspconfig added, save, quit, re-open vim, run :Mason command to install new dependencies added.
--

