local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#{{colors.surface_dim.default.hex_stripped}}', -- Default Background
    base01 = '#{{colors.surface_container.default.hex_stripped}}', -- Lighter Background (status bars)
    base02 = '#{{colors.surface_variant.default.hex_stripped}}', -- Selection Background
    base03 = '#{{colors.on_surface_variant.default.hex_stripped}}', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#{{colors.on_surface_variant.default.hex_stripped}}', -- Dark Foreground (status bars)
    base05 = '#{{colors.on_surface.default.hex_stripped}}', -- Default Foreground
    base06 = '#{{colors.on_surface.default.hex_stripped}}', -- Light Foreground
    base07 = '#{{colors.on_surface.default.hex_stripped}}', -- Lightest Foreground
    -- Accent colors
    base08 = '#{{colors.error.default.hex_stripped}}', -- Variables, XML Tags, Errors
    base09 = '#{{colors.tertiary_fixed_dim.default.hex_stripped}}', -- Integers, Constants
    base0A = '#{{colors.secondary.default.hex_stripped}}', -- Classes, Search Background
    base0B = '#{{colors.primary.default.hex_stripped}}', -- Strings, Diff Inserted
    base0C = '#{{colors.tertiary.default.hex_stripped}}', -- Regex, Escape Chars
    base0D = '#{{colors.primary_fixed.default.hex_stripped}}', -- Functions, Methods
    base0E = '#{{colors.secondary.default.hex_stripped}}', -- Keywords, Storage
    base0F = '#{{colors.error_container.default.hex_stripped}}', -- Deprecated, Embedded Tags
  }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M