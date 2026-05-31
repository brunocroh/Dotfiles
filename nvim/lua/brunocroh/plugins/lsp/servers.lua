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

vim.filetype.add({
  pattern = {
    ['%.gitlab%-ci%.ya?ml'] = 'yaml.gitlab',
  },
})

---List of the LSP server that don't need special configuration
local servers = {
  'zls',                    -- Zig
  'html',                   -- HTML
  'ts_ls',                  -- Typescript
  'gopls',                  -- Gopls
  'cssls',                  -- CSS
  'jsonls',                 -- Json
  'yamlls',                 -- YAML
  'gdscript',               -- GodotLanguage
  'eslint',                 -- Eslint
  'oxlint',                 -- Oxlint
  'lua_ls',                 -- Lua
  'graphql',                -- GraphQL
  'rust_analyzer',          -- Rust
  'kotlin_language_server', -- Kotlin
  'terraformls',            -- Terraform
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
    on_attach = on_attach,
  })
  vim.lsp.enable(server)
end

vim.lsp.config('tailwindcss', {
  flags = flags,
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
