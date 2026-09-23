local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#141314', -- Default Background
    base01 = '#211f20', -- Lighter Background (status bars)
    base02 = '#4a454a', -- Selection Background
    base03 = '#cdc4ca', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#cdc4ca', -- Dark Foreground (status bars)
    base05 = '#e6e1e2', -- Default Foreground
    base06 = '#e6e1e2', -- Light Foreground
    base07 = '#e6e1e2', -- Lightest Foreground
    -- Accent colors
    base08 = '#ffb4ab', -- Variables, XML Tags, Errors
    base09 = '#c7c8b7', -- Integers, Constants
    base0A = '#ccc4c9', -- Classes, Search Background
    base0B = '#cfc3cd', -- Strings, Diff Inserted
    base0C = '#c7c8b7', -- Regex, Escape Chars
    base0D = '#ecdfe9', -- Functions, Methods
    base0E = '#ccc4c9', -- Keywords, Storage
    base0F = '#93000a', -- Deprecated, Embedded Tags
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