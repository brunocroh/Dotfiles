local o = vim.o
local set = vim.opt

vim.wo.wrap = false
o.guifont = "FiraCode Nerd Font:h17"
vim.blamer_enabled = 1
o.termguicolors = true
o.background = "dark"
vim.api.nvim_set_option("clipboard", "unnamed")
set.signcolumn = "yes:1"

vim.api.nvim_create_user_command('PackageReload', function(info)
  for _, pkg in ipairs(info.fargs) do
    package.loaded[pkg] = nil
    require(pkg) -- may want to comment this out depending on how you want to use the module
  end
end, {
  nargs = '+',
  complete = function(arg_lead, _, _)
    return vim.tbl_keys(package.loaded)
    -- return vim.tbl_filter(function(mod_name) return string.find(mod_name, arg_lead, 1, true) end, vim.tbl_keys(package.loaded)) -- use this instead if you don't have a command completion plugin like nvim-cmp
  end,
  desc = 'Clear cached lua modules and re-require them',
})
