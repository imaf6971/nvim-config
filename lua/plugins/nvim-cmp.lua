local cmp = require "cmp"

local luasnip = require "luasnip"
require("luasnip/loaders/from_vscode").lazy_load()

local lspkind = require "lspkind"

vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" }, --lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- filesystem paths
  },
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "..."
    })
  }
})
