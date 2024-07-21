-- Purpose: Provide syntax highlighting.

return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vim",
                "lua",
                "c",
                "cpp",
                "python",
                "html",
                "css",
                "javascript",
                "typescript",
            },
            ignore_install = { "latex" },
            highlight = {
                enable = true,
                disable = {"latex"},
            }
        })
    end
}
