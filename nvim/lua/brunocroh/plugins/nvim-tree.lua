vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    side = 'right',
    relativenumber = true,
  },
  filters = {
    custom = { '.git$', 'node_modules$', '^target$' },
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      },
      glyphs = {
        default = '',
        git = {
          unstaged = '~',
          staged = '+',
          unmerged = '!',
          renamed = '≈',
          untracked = '?',
          deleted = '-',
        },
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

vim.keymap.set('n', '<leader>n', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<F4>', '<CMD>NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true }),
  pattern = 'NvimTree',
  callback = function()
    vim.api.nvim_win_set_option(0, 'wrap', false)
  end,
})
