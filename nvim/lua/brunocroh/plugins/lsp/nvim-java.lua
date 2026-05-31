local U = require('brunocroh.plugins.lsp.utils')

local function read_file(path)
  local ok, lines = pcall(vim.fn.readfile, path)
  if not ok then
    return nil
  end

  return table.concat(lines, '\n')
end

local function parent_pom(path)
  local content = read_file(path)
  if not content or not content:find('<parent>', 1, true) then
    return nil
  end

  local relative_path = content:match('<relativePath>%s*(.-)%s*</relativePath>') or '../pom.xml'
  if relative_path == '' then
    return nil
  end

  local parent = vim.fs.normalize(vim.fs.dirname(path) .. '/' .. relative_path)
  if vim.fn.filereadable(parent) == 1 then
    return parent
  end
end

local function maven_root(dir)
  local pom = vim.fs.find('pom.xml', { path = dir, upward = true })[1]
  if not pom then
    return nil
  end

  while true do
    local parent = parent_pom(pom)
    if not parent then
      return vim.fs.dirname(pom)
    end

    pom = parent
  end
end

local function default_jdtls_root(bufnr)
  local file = vim.api.nvim_buf_get_name(bufnr)
  local dir = vim.fs.dirname(file)
  local root = maven_root(dir)

  if root then
    return root
  end

  local marker_groups = {
    { 'mvnw', 'gradlew', 'settings.gradle', 'settings.gradle.kts' },
    { 'build.xml', 'build.gradle', 'build.gradle.kts' },
    { '.git' },
  }

  for _, markers in ipairs(marker_groups) do
    local marker = vim.fs.find(markers, { path = dir, upward = true })[1]
    if marker then
      return vim.fs.dirname(marker)
    end
  end
end

require('java').setup()

vim.lsp.config('jdtls', {
  capabilities = U.capabilities(),
  root_dir = function(bufnr, on_dir)
    local root = default_jdtls_root(bufnr)
    if root then
      on_dir(root)
    end
  end,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end,
})

vim.lsp.enable('jdtls')
