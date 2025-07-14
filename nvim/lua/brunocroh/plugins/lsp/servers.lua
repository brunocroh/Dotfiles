local lsp = require('lspconfig')
local U = require('brunocroh.plugins.lsp.utils')

---Common perf related flags for all the LSP servers
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
  U.disable_formatting(client)
  U.mappings(buf)
end

-- Disable LSP logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)



-- Configuring native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = 'always',
  },
  float = {
    source = 'always',
  },
})

-- Lua
lsp.lua_ls.setup({})

lsp.tailwindcss.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'html',
  },
  setttings = {
    experimental = {
      classRegex = {
        { "cva\\(([^)]*)\\)",  "[\"'`]([^\"'`]*).*?[\"'`]" },
        { "cx\\(([^)]*)\\)",   "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        { "cn\\(([^)]*)\\)",   "[\"'`]([^\"'`]*).*?[\"'`]" },
        { "([a-zA-Z0-9\\-:]+)" },
      },
    }
  }
})

lsp.ts_ls.setup({
  init_options = { hostInfo = 'neovim' },
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'typescript.tsx',
  },
  root_dir = lsp.util.root_pattern('tsconfig.json', 'package.json'),
  single_file_support = true,
})


-- Graphql
lsp.graphql.setup({})


-- Rust
lsp.rust_analyzer.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = 'clippy',
      },
      procMacro = {
        ignored = {
          ['async-trait'] = { 'async_trait' },
          ['napi-derive'] = { 'napi' },
          ['async-recursion'] = { 'async_recursion' },
        },
      },
    },
  },
})

lsp.eslint.setup({})

---List of the LSP server that don't need special configuration
local servers = {
  'zls',    -- Zig
  'html',   -- HTML
  'cssls',  -- CSS
  'jsonls', -- Json
  'yamlls', -- YAML
  -- 'terraformls', -- Terraform
}

for _, server in ipairs(servers) do
  lsp[server].setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

lsp.gdscript.setup({})
