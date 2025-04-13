local types = require('luasnip.util.types')
local ls = require('luasnip')


ls.setup({
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '●', 'DiffAdd' } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { '●', 'DiffDelete' } },
      },
    },
  },
})

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  override_builtin = true,
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/brunocroh/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

-- Allow jsx and tsx to use js snippets
require('luasnip').filetype_extend('javascript', { 'javascriptreact', 'typescriptreact' })

-- Map do reload snippets
vim.keymap.set('n', '<leader><leader>l', '<cmd>source ~/.config/nvim/lua/brunocroh/plugins/lsp/luasnip.lua<CR>')

-- Mappins to move around inside snippets
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set({ 'i', 's' }, '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
vim.keymap.set({ "i", "s" }, "<C-n>", function()
  if require("luasnip").choice_active() then
    require("luasnip").change_choice(1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-p>", function()
  if require("luasnip").choice_active() then
    require("luasnip").change_choice(-1)
  end
end, { silent = true })
