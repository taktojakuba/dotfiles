 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#161311', -- Default Background
     base01 = '#26211e', -- Lighter Background (status bars)
     base02 = '#312b27', -- Selection Background
     base03 = '#6f5e55', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#c4b4a1', -- Dark Foreground (status bars)
     base05 = '#e6dfd3', -- Default Foreground
     base06 = '#e6dfd3', -- Light Foreground
     base07 = '#e6dfd3', -- Lightest Foreground
     -- Accent colors
     base08 = '#e37874', -- Variables, XML Tags, Errors
     base09 = '#e09260', -- Integers, Constants
     base0A = '#dfb26c', -- Classes, Search Background
     base0B = '#a2b574', -- Strings, Diff Inserted
     base0C = '#eab694', -- Regex, Escape Chars
     base0D = '#d0e996', -- Functions, Methods
     base0E = '#e9c896', -- Keywords, Storage
     base0F = '#95140f', -- Deprecated, Embedded Tags
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
