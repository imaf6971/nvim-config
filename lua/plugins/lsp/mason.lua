local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup {
  ensure_installed = {
    "tsserver",
    "clangd",
    "eslint",
    "jsonls",
    "prismals",
    "rust_analyzer",
    "html",
    "cssls",
    "tailwindcss",
  }
}
