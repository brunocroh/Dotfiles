local cmpModule = require('cmp')

local icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = 'ﰠ',
  Variable = '',
  Class = 'ﴯ',
  Interface = '',
  Module = '',
  Property = 'ﰠ',
  Unit = '塞',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = 'פּ',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

local aliases = {
  nvim_lsp = 'lsp',
  luasnip = 'snippet',
}

cmpModule.setup({
  mapping = cmpModule.mapping.preset.insert({
    ["<C-k>"] = cmpModule.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmpModule.mapping.select_next_item(), -- next suggestion
    ['<C-d>'] = cmpModule.mapping.scroll_docs(-4),
    ['<C-f>'] = cmpModule.mapping.scroll_docs(4),
    ['<C-Space>'] = cmpModule.mapping.complete(),
    ['<C-e>'] = cmpModule.mapping.close(),
    ['<CR>'] = cmpModule.mapping.confirm({
      behavior = cmpModule.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmpModule.config.sources({
    { name = 'nvim_lsp', max_item_count = 100 },
    { name = 'luasnip', max_item_count = 10 },
    { name = 'path', max_item_count = 10 },
    { name = 'buffer', max_item_count = 10 },
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, item)
      -- Kind icons
      item.kind = string.format('%s %s', icons[item.kind], item.kind)
      -- Source
      item.menu = string.format('[%s]', aliases[entry.source.name] or entry.source.name)
      return item
    end,
  },
})
