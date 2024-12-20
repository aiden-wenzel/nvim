local filePath = "/home/aidenwen/.config/nvim/lua/aidenwen/current-colorscheme.txt"

local file = io.open(filePath, "r")

io.input(file)

local colorscheme = io.read("*a")

vim.cmd("colorscheme " .. colorscheme)

local function setColorScheme()
	local scheme = vim.fn.input("Enter new colorscheme: ")
	vim.cmd("colorscheme " .. scheme)

	local outputFile = io.open(filePath, "w")
	io.output(outputFile)
	io.write(scheme)
end

vim.keymap.set("n", "<leader>l", setColorScheme, { noremap = true, silent = true })
