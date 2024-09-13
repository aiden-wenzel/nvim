-- purpose: Provide neovim with a debugger interface.

return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local daptext = require("nvim-dap-virtual-text")

		daptext.setup()

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

		dap.adapters.codelldb = {
			type = 'server',
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = '/home/aidenwen/.local/share/nvim/mason/bin/codelldb',
				args = {"--port", "${port}"},

				-- On windows you may have to uncomment this:
				-- detached = false,
			}
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				args = function()
					local arguments = vim.fn.input("Arguments: ");
					return vim.split(arguments, " ");
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp

		require('dap-python').setup('.venv/bin/python')
	end
}
