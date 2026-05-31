require("trouble").setup({})

vim.keymap.set("n", "<F2>", "<cmd>Trouble diagnostics toggle<cr>",
  { silent = true, noremap = true }
)
