local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#141312', -- Default Background
    base01 = '#201f1e', -- Lighter Background (status bars)
    base02 = '#49473f', -- Selection Background
    base03 = '#cbc6bc', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#cbc6bc', -- Dark Foreground (status bars)
    base05 = '#e6e2df', -- Default Foreground
    base06 = '#e6e2df', -- Light Foreground
    base07 = '#e6e2df', -- Lightest Foreground
    -- Accent colors
    base08 = '#ffb4ab', -- Variables, XML Tags, Errors
    base09 = '#cac5cd', -- Integers, Constants
    base0A = '#cac6bf', -- Classes, Search Background
    base0B = '#cbc6b8', -- Strings, Diff Inserted
    base0C = '#cac5cd', -- Regex, Escape Chars
    base0D = '#e8e2d3', -- Functions, Methods
    base0E = '#cac6bf', -- Keywords, Storage
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