return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("dashboard").setup({
            theme = "doom",

            config = {
                header = {
                    "",
                    " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                    " ████╗  ██║██║   ██║██║████╗ ████║",
                    " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
                    " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                    " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                    " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                    "",
                },

                center = {
                    {
                        desc = "Find File",
                        key = "f",
                        action = "Telescope find_files",
                    },

                    {
                        desc = "Recent Files",
                        key = "r",
                        action = "Telescope oldfiles",
                    },

                    {
                        desc = "Quit",
                        key = "q",
                        action = "qa",
                    },
                },

                vertical_center = true,
            },
        })
    end,
}
