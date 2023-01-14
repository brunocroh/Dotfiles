require("trouble").setup()

vim.keymap.set("n", "<F2>", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
