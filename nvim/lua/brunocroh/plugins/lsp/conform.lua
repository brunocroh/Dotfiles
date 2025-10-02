local conform = require("conform")
local util = require("conform.util")
conform.setup({
  formatters_by_ft = {
    javascript = { "eslint_d", "prettierd", "biome" },
    javascriptreact = { "eslint_d", "prettierd", "biome" },
    typescript = { "eslint_d", "prettierd", "biome" },
    typescriptreact = { "eslint_d", "prettierd", "biome" },
    lua = { "stylua" },
    css = { "prettierd" },
    scss = { "prettierd" },
    markdown = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    md = { "prettierd" },
    txt = { "prettierd" },
    go = { "gofmt" },
  },
  formatters = {
    stylua = {
      args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    },
    biome = {
      require_cwd = true,
    },
    yamlfix = {
      require_cwd = true,
    },
    eslint_d = {
      require_cwd = true,
      cwd = util.root_file({ ".eslintrc.json" }),
    },
    prettierd = {
      require_cwd = true,
    }
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
