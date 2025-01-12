vim.g.mapleader = ' '

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>Q', '<cmd>q<CR>')
map('n', '<leader>q', '<cmd>wq<CR>')
map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>s', '<cmd>update<CR>')
map('n', '<leader>t', '<cmd>LspStart tsserver<CR>')


map('n', '<leader><leader>x', '<cmd>source %<CR>')
map('n', '<leader>x', '<cmd>:.lua<CR>')
map('v', '<leader>x', '<cmd>:lua<CR>')

vim.g.user_emmet_leader_key=','
vim.g.user_emmet_settings = {
  indent_blockelement = 1,
}
