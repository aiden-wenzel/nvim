return {
    "olimorris/onedarkpro.nvim",

    config = function()
        require("onedarkpro").setup({
            highlights = {
                Comment = { italic = false},
                Directory = { bold = false},
                ErrorMsg = { italic = false, bold = false}
            },
            options = {
                transparency = true
            }
        })

        vim.cmd("colorscheme onedark")
    end
}
