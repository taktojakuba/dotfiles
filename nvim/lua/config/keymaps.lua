-- KEYBINDS
--
local keymap = vim.keymap.set
vim.g.mapleader = " "
keymap("n", "<leader>cd", vim.cmd.Ex)
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")
vim.opt.mouse = "a"
-- source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- select all
keymap("n", "<leader>a", "ggVG", { desc = "Select all" })

-- GIT (vim-fugitive)
keymap("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
keymap("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
keymap("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
keymap("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
keymap("n", "<leader>gi", ":Git init<CR>", { desc = "Git init" })
keymap("n", "<leader>ga", ":Git add .<CR>", { desc = "Git add all" })

-- NeoTree
keymap("n","<leader>e", ":NeoTree toggle<CR>")
