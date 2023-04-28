vim.g.mapleader = ' '

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', 'q', '<cmd>cclose<CR>')
map('n', '<leader>Q', '<cmd>q<CR>')
map('n', '<leader>q', '<cmd>wq<CR>')
map('n', '<leader>s', '<cmd>update<CR>')
