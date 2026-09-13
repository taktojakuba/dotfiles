local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#212529', -- Default Background
    base01 = '#495057', -- Lighter Background (status bars)
    base02 = '#495057', -- Selection Background
    base03 = '#868e96', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#868e96', -- Dark Foreground (status bars)
    base05 = '#f8f9fa', -- Default Foreground
    base06 = '#f8f9fa', -- Light Foreground
    base07 = '#f8f9fa', -- Lightest Foreground
    -- Accent colors
    base08 = '#f7768e', -- Variables, XML Tags, Errors
    base09 = '#6c757d', -- Integers, Constants
    base0A = '#ced4da', -- Classes, Search Background
    base0B = '#adb5bd', -- Strings, Diff Inserted
    base0C = '#dee2e6', -- Regex, Escape Chars
    base0D = '#adb5bd', -- Functions, Methods
    base0E = '#ced4da', -- Keywords, Storage
    base0F = '#db4b4b', -- Deprecated, Embedded Tags
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