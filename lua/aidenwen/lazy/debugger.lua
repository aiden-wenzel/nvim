local dap = require("dap")
local dapui = require("dapui")
dapui.setup()

vim.keymap.set("n", "<Leader><F5>", dap.continue)
vim.keymap.set("n", "<Leader>so", dap.step_over)
vim.keymap.set("n", "<Leader>si", dap.step_into)
vim.keymap.set("n", "<Leader>sv", dap.step_out)

vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)

vim.keymap.set("n", "<Leader>di", dapui.toggle)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
    console = "integratedTerminal",
  },
}

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
