local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    {"olimorris/onedarkpro.nvim", priority = 1000, },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    'nvim-treesitter/nvim-treesitter',
    "lewis6991/gitsigns.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    "windwp/nvim-autopairs",
    "prichrd/netrw.nvim",
    "nvim-tree/nvim-web-devicons",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
}

local opts = {}
require("lazy").setup(plugins, opts)
