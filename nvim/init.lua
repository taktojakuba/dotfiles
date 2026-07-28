vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true
vim.opt.relativenumber = false
vim.g.mapleader = " "

-- lazy nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "RRethy/nvim-base16", priority = 1000 },
  { "nvim-telescope/telescope.nvim", version = "0.2.2", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim", dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" } },
  { "neovim/nvim-lspconfig" },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"]     = { "hide" },
        ["<C-y>"]     = { "select_and_accept" },
        ["<CR>"]      = { "select_and_accept", "fallback" },
        ["<C-p>"]     = { "select_prev", "fallback" },
        ["<C-n>"]     = { "select_next", "fallback" },
        ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
        ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
        ["<Tab>"]     = { "snippet_forward", "fallback" },
        ["<S-Tab>"]   = { "snippet_backward", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      signature = {
        enabled = true,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
            { icon = " ", desc = "New File", group = "Label", key = "n", action = "ene | startinsert" },
            { icon = " ", desc = "Recent Files", group = "Label", key = "r", action = "Telescope oldfiles" },
            { icon = " ", desc = "Open Project", group = "Label", key = "p", action = "Telescope projects" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
          vertical_center = true,
        },
      })
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = nil,
      smear_between_buffers = true,
      smear_between_windows = true,
      smear_insert_mode = true,
      smear_terminal_mode = true,
      legacy_computing_symmetry_mode = false,
      distance_scayle_method = "linear",
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      trailing_exponent = 0.1,
      ghost_exponent = 0.1,
      never_update_overlapping = false,
      max_kept_history = 0,
      filetypes_disabled = {},
      hide_target_hack = true,
      gamma = 1,
    },
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      duration_multiplier = 1,
      easing = "linear",
      hide_cursor = true,
      cursor_scrolls_alone = true,
      performance_mode = false,
      ignored_filetypes = {},
      ignored_buftypes = {},
    },
  },
  { "vyfor/cord.nvim", opts = { display = { theme = "classic", flavor = "accent" } } },
}

require("lazy").setup(plugins)
require("matugen").setup()

local builtin = require("telescope.builtin")

require("telescope").load_extension("ui-select")

require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
require("nvim-treesitter").install({ "lua", "javascript" })

require("nvim-tree").setup()

require("lualine").setup({
  options = { theme = "auto" },
})

-- lsp config
local capabilities = require("blink.cmp").get_lsp_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "F", vim.lsp.buf.format, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        end,
      })
    end,
  },
})

-- key bindings
vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { noremap = true })
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { noremap = true })
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFocus<cr>", { noremap = true })

-- neoscroll keybinds
local neoscroll = require("neoscroll")
vim.keymap.set("n", "<C-Up>", function() neoscroll.scroll(-0.5, { duration = 200 }) end, { silent = true })
vim.keymap.set("n", "<C-Down>", function() neoscroll.scroll(0.5, { duration = 200 }) end, { silent = true })
vim.keymap.set("i", "<C-Up>", function() neoscroll.scroll(-0.5, { duration = 200, move_cursor = false }) end, { silent = true })
vim.keymap.set("i", "<C-Down>", function() neoscroll.scroll(0.5, { duration = 200, move_cursor = false }) end, { silent = true })
vim.keymap.set("v", "<C-Up>", function() neoscroll.scroll(-0.5, { duration = 200 }) end, { silent = true })
vim.keymap.set("v", "<C-Down>", function() neoscroll.scroll(0.5, { duration = 200 }) end, { silent = true })
