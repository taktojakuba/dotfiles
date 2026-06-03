-- =============================================================================
-- Noctalia Neovim Template
-- Place at: ~/.config/nvim/lua/matugen-template.lua
--
-- This file is processed by Noctalia's template engine.
-- Noctalia replaces {{colors.*}} tokens with live Material Design 3 colors
-- derived from your wallpaper. The output is written to:
--   ~/.config/nvim/lua/matugen.lua
--
-- Register this template in ~/.config/noctalia/user-templates.toml:
--
--   [templates.nvim-base16]
--   input_path  = "~/.config/nvim/lua/matugen-template.lua"
--   output_path = "~/.config/nvim/lua/matugen.lua"
--   post_hook   = "pkill -SIGUSR1 nvim"
--
-- Then in ~/.config/nvim/init.lua add:
--   require('matugen').setup()
-- =============================================================================

local M = {}

function M.setup()
  -- -------------------------------------------------------------------------
  -- base16-nvim palette mapped to Noctalia Material Design 3 color tokens
  -- -------------------------------------------------------------------------
  require('base16-colorscheme').setup {

    -- Backgrounds (darkest → lightest)
    base00 = '{{colors.surface.default.hex}}',                -- Default background
    base01 = '{{colors.surface_container.default.hex}}',      -- Status bars, sidebars
    base02 = '{{colors.surface_container_high.default.hex}}', -- Selection background
    base03 = '{{colors.outline.default.hex}}',                -- Comments, invisible chars

    -- Foregrounds (darkest → lightest)
    base04 = '{{colors.on_surface_variant.default.hex}}',     -- Dark foreground (status bars)
    base05 = '{{colors.on_surface.default.hex}}',             -- Default foreground / normal text
    base06 = '{{colors.on_surface.default.hex}}',             -- Light foreground
    base07 = '{{colors.on_background.default.hex}}',          -- Lightest foreground / headings

    -- Accent palette
    base08 = '{{colors.error.default.hex}}',                  -- Variables, XML tags, errors, diffs (deleted)
    base09 = '{{colors.tertiary.default.hex}}',               -- Integers, booleans, constants
    base0A = '{{colors.secondary.default.hex}}',              -- Classes, search text background
    base0B = '{{colors.primary.default.hex}}',                -- Strings, diffs (inserted)
    base0C = '{{colors.tertiary_fixed_dim.default.hex}}',     -- Regex, escape chars, embedded language
    base0D = '{{colors.primary_fixed_dim.default.hex}}',      -- Functions, methods, attributes
    base0E = '{{colors.secondary_fixed_dim.default.hex}}',    -- Keywords, storage, selectors
    base0F = '{{colors.error_container.default.hex}}',        -- Deprecated elements, embedded tags
  }

  -- -------------------------------------------------------------------------
  -- Optional: override specific highlight groups for a tighter MD3 fit
  -- -------------------------------------------------------------------------
  local hi = vim.api.nvim_set_hl

  -- Diagnostics
  hi(0, 'DiagnosticError',       { fg = '{{colors.error.default.hex}}' })
  hi(0, 'DiagnosticWarn',        { fg = '{{colors.tertiary.default.hex}}' })
  hi(0, 'DiagnosticInfo',        { fg = '{{colors.primary.default.hex}}' })
  hi(0, 'DiagnosticHint',        { fg = '{{colors.secondary.default.hex}}' })

  -- Floating windows / popups
  hi(0, 'NormalFloat',           { bg = '{{colors.surface_container_lowest.default.hex}}',
                                   fg = '{{colors.on_surface.default.hex}}' })
  hi(0, 'FloatBorder',           { fg = '{{colors.outline_variant.default.hex}}' })

  -- Cursor line / column
  hi(0, 'CursorLine',            { bg = '{{colors.surface_container_low.default.hex}}' })
  hi(0, 'CursorLineNr',          { fg = '{{colors.primary.default.hex}}',
                                   bg = '{{colors.surface_container_low.default.hex}}',
                                   bold = true })

  -- Visual selection
  hi(0, 'Visual',                { bg = '{{colors.primary_container.default.hex}}',
                                   fg = '{{colors.on_primary_container.default.hex}}' })

  -- Search
  hi(0, 'Search',                { bg = '{{colors.secondary_container.default.hex}}',
                                   fg = '{{colors.on_secondary_container.default.hex}}' })
  hi(0, 'IncSearch',             { bg = '{{colors.primary.default.hex}}',
                                   fg = '{{colors.on_primary.default.hex}}' })

  -- Diff
  hi(0, 'DiffAdd',               { bg = '{{colors.primary_container.default.hex | set_alpha 0.3}}' })
  hi(0, 'DiffDelete',            { bg = '{{colors.error_container.default.hex | set_alpha 0.3}}' })
  hi(0, 'DiffChange',            { bg = '{{colors.secondary_container.default.hex | set_alpha 0.3}}' })
  hi(0, 'DiffText',              { bg = '{{colors.secondary.default.hex | set_alpha 0.4}}' })

  -- Pmenu (autocomplete)
  hi(0, 'Pmenu',                 { bg = '{{colors.surface_container_high.default.hex}}',
                                   fg = '{{colors.on_surface.default.hex}}' })
  hi(0, 'PmenuSel',              { bg = '{{colors.primary_container.default.hex}}',
                                   fg = '{{colors.on_primary_container.default.hex}}' })
  hi(0, 'PmenuSbar',             { bg = '{{colors.surface_container_highest.default.hex}}' })
  hi(0, 'PmenuThumb',            { bg = '{{colors.outline_variant.default.hex}}' })

  -- Status line (works with lualine as a fallback)
  hi(0, 'StatusLine',            { bg = '{{colors.surface_container_high.default.hex}}',
                                   fg = '{{colors.on_surface.default.hex}}' })
  hi(0, 'StatusLineNC',          { bg = '{{colors.surface_container.default.hex}}',
                                   fg = '{{colors.on_surface_variant.default.hex}}' })

  -- Indent guides / BlankLine
  hi(0, 'IblIndent',             { fg = '{{colors.outline_variant.default.hex | set_alpha 0.5}}' })
  hi(0, 'IblScope',              { fg = '{{colors.outline.default.hex}}' })

  -- Telescope
  hi(0, 'TelescopeNormal',       { bg = '{{colors.surface_container_lowest.default.hex}}' })
  hi(0, 'TelescopeBorder',       { fg = '{{colors.outline_variant.default.hex}}',
                                   bg = '{{colors.surface_container_lowest.default.hex}}' })
  hi(0, 'TelescopeSelection',    { bg = '{{colors.primary_container.default.hex}}',
                                   fg = '{{colors.on_primary_container.default.hex}}' })
  hi(0, 'TelescopeMatching',     { fg = '{{colors.primary.default.hex}}', bold = true })

  -- GitSigns
  hi(0, 'GitSignsAdd',           { fg = '{{colors.primary.default.hex}}' })
  hi(0, 'GitSignsChange',        { fg = '{{colors.secondary.default.hex}}' })
  hi(0, 'GitSignsDelete',        { fg = '{{colors.error.default.hex}}' })

  -- NvimTree / neo-tree
  hi(0, 'NvimTreeNormal',        { bg = '{{colors.surface_container_low.default.hex}}' })
  hi(0, 'NvimTreeFolderIcon',    { fg = '{{colors.primary.default.hex}}' })
  hi(0, 'NvimTreeOpenedFile',    { fg = '{{colors.secondary.default.hex}}', bold = true })

  -- WhichKey
  hi(0, 'WhichKey',              { fg = '{{colors.primary.default.hex}}' })
  hi(0, 'WhichKeyGroup',         { fg = '{{colors.secondary.default.hex}}' })
  hi(0, 'WhichKeyDesc',          { fg = '{{colors.on_surface_variant.default.hex}}' })
  hi(0, 'WhichKeyFloat',         { bg = '{{colors.surface_container_lowest.default.hex}}' })
end

-- =============================================================================
-- SIGUSR1 hot-reload handler
-- Noctalia sends SIGUSR1 (via post_hook "pkill -SIGUSR1 nvim") after it
-- regenerates matugen.lua.  This handler clears the cached module and
-- re-applies the new colors without restarting Neovim.
-- =============================================================================
local signal = vim.uv.new_signal()
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
