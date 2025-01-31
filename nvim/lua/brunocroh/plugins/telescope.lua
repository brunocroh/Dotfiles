local telescope = require('telescope')
local actions = require('telescope.actions')
local finders = require('telescope.builtin')
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
  defaults = {
    path_display = { "smart" },
    prompt_prefix = ' ❯ ',
    initial_mode = 'insert',
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      i = {
        ['<ESC>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
        ['<C-s>'] = actions.send_selected_to_qflist,
        ['<C-q>'] = actions.send_to_qflist,
        ["<C-i>"] = lga_actions.quote_prompt(),
      },
    },
    file_ignore_patterns = {
      "node_modules",
      "build",
      "dist",
      ".git"
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true, -- overrid the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = 'smart_case',       -- "smart_case" | "ignore_case" | "respect_case"
    },
  },
})

telescope.load_extension('live_grep_args')
telescope.load_extension('fzf')

local builtin = require "telescope.builtin"

local Telescope = setmetatable({}, {
  __index = function(_, k)
    if vim.bo.filetype == 'NvimTree' then
      vim.cmd.wincmd('l')
    end
    return finders[k]
  end,
})

local ctrlp = function()
  local ok = pcall(Telescope.git_files, { show_untracked = true })
  if not ok then
    Telescope.find_files()
  end
end


vim.keymap.set('n', '<C-P>', ctrlp)
vim.keymap.set('n', '<leader>p', ctrlp)

-- Get :help at the speed of light
vim.keymap.set('n', '<leader>H', Telescope.help_tags)
vim.keymap.set('n', "<leader>th", Telescope.help_tags)

-- Fuzzy find active buffers
vim.keymap.set('n', "<leader>b", Telescope.buffers)
vim.keymap.set('n', "<leader>d", Telescope.diagnostics)

-- Search for string
vim.keymap.set("n", "<leader>i", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Fuzzy find changed files in git
vim.keymap.set('n', "<leader>o", Telescope.git_status)

vim.keymap.set("n", "<space>en", function()
  builtin.find_files { cwd = "~/.config/nvim/" }
end)
