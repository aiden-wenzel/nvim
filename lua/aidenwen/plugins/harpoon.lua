return {
    "ThePrimeagen/harpoon",

    config = function()
        vim.keymap.set('n', '<leader>haf', ':lua require("harpoon.mark").add_file()<Enter>')
        vim.keymap.set("n", "<leader>hqm", ':lua require("harpoon.ui").toggle_quick_menu()<Enter>')
        vim.keymap.set('n', '<leader>hn', ':lua require("harpoon.ui").nav_next()<Enter>')
        vim.keymap.set('n', '<leader>hp', ':lua require("harpoon.ui").nav_prev()<Enter>')

    end
}
