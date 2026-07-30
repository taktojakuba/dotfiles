 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#151129', -- Default Background
     base01 = '#1b172e', -- Lighter Background (status bars)
     base02 = '#231e3c', -- Selection Background
     base03 = '#6756a3', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#b1abe1', -- Dark Foreground (status bars)
     base05 = '#b1abe1', -- Default Foreground
     base06 = '#b1abe1', -- Light Foreground
     base07 = '#b1abe1', -- Lightest Foreground
     -- Accent colors
     base08 = '#d4687b', -- Variables, XML Tags, Errors
     base09 = '#4f4289', -- Integers, Constants
     base0A = '#635b8d', -- Classes, Search Background
     base0B = '#9081ce', -- Strings, Diff Inserted
     base0C = '#a596e9', -- Regex, Escape Chars
     base0D = '#a696e9', -- Functions, Methods
     base0E = '#a396e9', -- Keywords, Storage
     base0F = '#751425', -- Deprecated, Embedded Tags
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
