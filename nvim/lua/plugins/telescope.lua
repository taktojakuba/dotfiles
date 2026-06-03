return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>f", function()
            local dir = vim.fn.expand("%:p:h")

            builtin.find_files({
                cwd = dir,
            })
        end, {
            desc = "Find files in current file directory",
        })
    end,
}
