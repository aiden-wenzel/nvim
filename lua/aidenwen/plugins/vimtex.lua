return {
    "lervag/vimtex",
    lazy = false,
    config = function()
       vim.cmd("filetype plugin on")
       vim.cmd("set encoding=utf8")
       vim.cmd("let g:vimtex_mappings_enabled=1")
    end
}
