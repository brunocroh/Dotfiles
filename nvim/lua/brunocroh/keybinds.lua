vim.g.mapleader = ' '

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>Q', '<cmd>q!<CR>')
map('n', '<leader>q', '<cmd>wq<CR>')
map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>s', '<cmd>update<CR>')
map('n', '<leader>t', '<cmd>LspStart tsserver<CR>')

map('n', '<leader><leader>x', '<cmd>source %<CR>')

vim.api.nvim_set_keymap('n', '<leader><leader>r', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

map('n', '<leader>x', '<cmd>:.lua<CR>')
map('v', '<leader>x', '<cmd>:lua<CR>')

vim.g.user_emmet_leader_key=','
vim.g.user_emmet_settings = {
  indent_blockelement = 1,
}

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yak', {clear = true}),
  callback = function()
      vim.highlight.on_yank()
  end
})
