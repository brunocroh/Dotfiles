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
lsp.lua_ls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        enable = true,
        showWord = 'Disable',
        -- keywordSnippet = 'Disable',
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          os.getenv('VIMRUNTIME'),
          vim.fn.expand("~/.luarocks/share/lua/5.4")

        },
        userThirdParty = {os.getenv("HOME") .. ".local/share/LuaAddons"},
        checkThirdParty = "Apply"
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lsp.tailwindcss.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = on_attach,
})


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

---List of the LSP server that don't need special configuration
local servers = {
  'zls', -- Zig
  'gopls', -- Golang
  'ts_ls', -- Typescript
  'html', -- HTML
  'cssls', -- CSS
  'jsonls', -- Json
  'yamlls', -- YAML
  'emmet_ls', -- emmet-ls
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
lsp.tailwindcss.setup({})

