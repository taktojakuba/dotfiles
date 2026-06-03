return {
    "Xuyuanp/scrollbar.nvim",

    init = function()
        local group_id = vim.api.nvim_create_augroup(
            "scrollbar_init",
            { clear = true }
        )

        vim.api.nvim_create_autocmd({
            "BufEnter",
            "WinScrolled",
            "WinResized",
        }, {
            group = group_id,
            pattern = "*",

            callback = function()
                require("scrollbar").show()
            end,
        })
    end,
}