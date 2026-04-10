vim.g.mapleader = ' '

local function map(m, k, v, op)
    vim.keymap.set(m, k, v, op or {silent = true})
end

map('n', '<leader>Q', '<cmd>q!<CR>')
map('n', '<leader>q', '<cmd>wq<CR>')
map('n', '<leader>s', '<cmd>update<CR>')
map('n', '<leader>t', '<cmd>LspStart tsserver<CR>')
map('n', '<leader>f', '<cmd>cope<CR>')

map('n', '<leader><leader>x', '<cmd>source %<CR>')

vim.api.nvim_set_keymap('n', '<leader><leader>r', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

map('n', '<leader>x', '<cmd>:.lua<CR>')
map('v', '<leader>x', '<cmd>:lua<CR>')

map('n', '<C-j>', '<cmd>:cnext<CR>')
map('n', '<C-k>', '<cmd>:cprev<CR>')

local qf_open = 0
map('n', '<C-q>', function ()
  if qf_open == 1 then
    vim.cmd('cclose')
    qf_open = 0
  else
    vim.cmd('copen')
    qf_open = 1
  end
end, { desc = 'toggle quickfix list'})

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
