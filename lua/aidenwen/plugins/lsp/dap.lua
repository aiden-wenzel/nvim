-- purpose: Provide neovim with a debugger interface.

return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.keymap.set('n', '<F5>', function() dap.continue() end)
		vim.keymap.set('n', '<F10>', function() dap.step_over() end)
		vim.keymap.set('n', '<F11>', function() dap.step_into() end)
		vim.keymap.set('n', '<F12>', function() dap.step_out() end)
		vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
		vim.keymap.set('n', '<Leader>dr', function() dap.repl.toggle() end)
		vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

		dapui.setup()
		vim.keymap.set('n', '<Leader>duo', function() dapui.open() end)
		vim.keymap.set('n', '<Leader>duc', function() dapui.close() end)
		vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
			require('dap.ui.widgets').hover()
		end)

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
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

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				args = function()
					local arguments = vim.fn.input("Arguments: ");
					return vim.split(arguments, " ");
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = true,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				pid = function()
					local name = vim.fn.input('Executable name (filter): ')
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = '${workspaceFolder}'
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'gdb',
				request = 'attach',
				target = 'localhost:1234',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}'
			},
		}
		require('dap-python').setup('.venv/bin/python')
	end
}
