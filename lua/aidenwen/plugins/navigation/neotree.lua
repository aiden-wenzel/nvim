-- Purpose: Add a file tree to the neovim UI.

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        require("neo-tree").setup{
            popup_boarder_style = "rounded",
            vim.keymap.set("n", "<leader>nt", vim.cmd.Neotree)
        }
    end
}
