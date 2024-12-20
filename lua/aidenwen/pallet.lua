local filePath = "/home/aidenwen/.config/nvim/lua/aidenwen/current-colorscheme.txt"

local file = io.open(filePath, "r")

io.input(file)

local colorscheme = io.read("*a")

vim.cmd("colorscheme " .. colorscheme)

local function setColorScheme(newColorScheme)
	vim.cmd("colorscheme " .. newColorScheme)

	local outputFile = io.open(filePath, "w")
	io.output(outputFile)
	io.write(newColorScheme)
end

vim.keymap.set("n", "<leader>cs", function() setColorScheme("carbonfox") end, { noremap = true, silent = true })
