 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#0f0a0b', -- Default Background
     base01 = '#1a1213', -- Lighter Background (status bars)
     base02 = '#261a1c', -- Selection Background
     base03 = '#795457', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#d9a0a6', -- Dark Foreground (status bars)
     base05 = '#e6a0a8', -- Default Foreground
     base06 = '#e6a0a8', -- Light Foreground
     base07 = '#e6a0a8', -- Lightest Foreground
     -- Accent colors
     base08 = '#d96a76', -- Variables, XML Tags, Errors
     base09 = '#e6a0a8', -- Integers, Constants
     base0A = '#d96a76', -- Classes, Search Background
     base0B = '#e0858d', -- Strings, Diff Inserted
     base0C = '#e9969f', -- Regex, Escape Chars
     base0D = '#e9969d', -- Functions, Methods
     base0E = '#e9969f', -- Keywords, Storage
     base0F = '#7e131e', -- Deprecated, Embedded Tags
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
