-- Purpose: Add indentation visualization and scope analysis.

return {
    "lukas-reineke/indent-blankline.nvim",

    config = function ()
       require("ibl").setup({
           scope = {
               enabled = true
           }
       })
    end
}
