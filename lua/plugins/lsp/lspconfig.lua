local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "gf", ":Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>d", ":Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", ":LSoutlineToggle<CR>", opts)

  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}
