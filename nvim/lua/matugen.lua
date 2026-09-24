local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#181818', -- Default Background
    base01 = '#2c2c2c', -- Lighter Background (status bars)
    base02 = '#2c2c2c', -- Selection Background
    base03 = '#a3a3a3', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#a3a3a3', -- Dark Foreground (status bars)
    base05 = '#ececec', -- Default Foreground
    base06 = '#ececec', -- Light Foreground
    base07 = '#ececec', -- Lightest Foreground
    -- Accent colors
    base08 = '#d9d9d9', -- Variables, XML Tags, Errors
    base09 = '#8a8a8a', -- Integers, Constants
    base0A = '#d1d1d1', -- Classes, Search Background
    base0B = '#b3b3b3', -- Strings, Diff Inserted
    base0C = '#ececec', -- Regex, Escape Chars
    base0D = '#d1d1d1', -- Functions, Methods
    base0E = '#d1d1d1', -- Keywords, Storage
    base0F = '#b3b3b3', -- Deprecated, Embedded Tags
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