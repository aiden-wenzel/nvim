return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require("dap")

        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F11>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
        vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
        vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
            require('dap.ui.widgets').hover()
        end)

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
    end
}
