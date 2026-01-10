local dap = require('dap')
local dapui = require('dapui')
local dapgo = require('dap-go')

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_game_instance = true,
    launch_scene = true,
  }
}

dap.configurations.gdresource = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}

dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6007,
}


vim.keymap.set('n', "<F5>", dap.continue)

dapui.setup()
dapgo.setup()
dap.listeners.before.attach.dapui_config = function()
 dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
 dapui.open()
end

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, {desc = "DAP: toggle breakpoint"})
vim.keymap.set('n', '<leader>dB', function() require('dap').set_breakpoint() end, {desc = "DAP: set breakpoint"})
vim.keymap.set('n', '<leader>dp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc ="DAP: set breakpoint log"})
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>dd', function() require('dap').disconnect({ terminateDebuggee = false }) end, {desc= "Dap Disconnect"})
vim.keymap.set('n', '<leader>dt', function() require('dap').disconnect({ terminateDebuggee = true }) end, {desc= "Dap Disconnect and terminate"})

vim.keymap.set('n', '<leader>w', function() dapui.open() end, {desc = "DAP: Open"} )
vim.keymap.set('n', '<leader>W', function() dapui.close() end ,{desc = "DAP: Close"})
