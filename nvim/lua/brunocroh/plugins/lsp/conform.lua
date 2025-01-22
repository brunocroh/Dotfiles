require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "eslint_d", "prettierd" },
    typescript = { "eslint_d", "prettierd" },
    typescriptreact = { "eslint_d", "prettierd" },
    css = { "prettierd" },
    scss = { "prettierd" },
    markdown = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    graphql = { "prettierd" },
    md = { "prettierd" },
    txt = { "prettierd" },
  },
  formatters = {
    stylua = {
      args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    },
  },
  format_on_save = {
    timeout_ms = 2000, -- Increase timeout to 5000ms (5 seconds)
    lsp_fallback = true,
    async = false -- Set to false to ensure completion before saving
  },
})

