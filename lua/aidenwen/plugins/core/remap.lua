-- Purpose: Remap default neovim motions and commands.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- pane navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- split screen
vim.keymap.set('n', '<leader>%', ':vsplit<CR>')
vim.keymap.set('n', '<leader>\"', ':split<CR>')
