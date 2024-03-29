vim.g.mapleader = ' '

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>Q', '<cmd>q<CR>')
map('n', '<leader>q', '<cmd>wq<CR>')
map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>s', '<cmd>update<CR>')
map('n', '<leader>t', '<cmd>LspStart tsserver<CR>')
