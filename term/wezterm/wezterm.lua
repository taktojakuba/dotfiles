local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():set_inner_size(1200, 800)
end)

return {
  color_scheme_dirs = { os.getenv('HOME') .. '/.config/wezterm/colors' },
  color_scheme = 'Noctalia',
  enable_tab_bar = false,
  window_decorations = 'NONE',
  window_background_opacity = 1.0,
  font_size = 12.0,
  hide_mouse_cursor_when_typing = true,

  window_close_confirmation = 'NeverPrompt',

  keys = {
    { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
    { key = 'q', mods = 'CTRL|SHIFT', action = act.QuitApplication },
    { key = 'f', mods = 'CTRL|SHIFT', action = act.ToggleFullScreen },
  },
}
