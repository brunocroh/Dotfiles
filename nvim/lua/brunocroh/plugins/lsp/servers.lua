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
})

lsp.ts_ls.setup({
  init_options = { hostInfo = 'neovim' },
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_dir = lsp.util.root_pattern('tsconfig.json', 'package.json'),
  single_file_support = true,
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

lsp.eslint.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Call the common on_attach function
    on_attach(client, bufnr)
    -- Enable formatting
    client.server_capabilities.documentFormattingProvider = true
    -- Optional: Automatically fix ESLint issues on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        -- Only run if eslint_d is available
        if vim.fn.executable('eslint_d') == 1 then
          local fileName = vim.api.nvim_buf_get_name(0)
          vim.fn.system('eslint_d --fix ' .. vim.fn.shellescape(fileName))
          -- Reload the buffer if it was modified
          vim.cmd('checktime')
        else
          vim.cmd('EslintFixAll')
        end
      end,
    })
  end,
  settings = {
    packageManager = 'npm', -- or 'yarn', 'pnpm'
    -- Optional: specify additional rules directories
    workingDirectory = { mode = 'auto' },
  },
})

---List of the LSP server that don't need special configuration
local servers = {
  'zls',      -- Zig
  'gopls',    -- Golang
  'ts_ls',    -- Typescript
  'html',     -- HTML
  'cssls',    -- CSS
  'jsonls',   -- Json
  'yamlls',   -- YAML
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
