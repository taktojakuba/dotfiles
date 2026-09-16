local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#131314', -- Default Background
    base01 = '#201f20', -- Lighter Background (status bars)
    base02 = '#43474a', -- Selection Background
    base03 = '#c4c7c9', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#c4c7c9', -- Dark Foreground (status bars)
    base05 = '#e5e2e2', -- Default Foreground
    base06 = '#e5e2e2', -- Light Foreground
    base07 = '#e5e2e2', -- Lightest Foreground
    -- Accent colors
    base08 = '#ffb4ab', -- Variables, XML Tags, Errors
    base09 = '#cec3cd', -- Integers, Constants
    base0A = '#c5c6c8', -- Classes, Search Background
    base0B = '#c1c7cc', -- Strings, Diff Inserted
    base0C = '#cec3cd', -- Regex, Escape Chars
    base0D = '#dde3e8', -- Functions, Methods
    base0E = '#c5c6c8', -- Keywords, Storage
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