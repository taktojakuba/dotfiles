import importlib.util
from pathlib import Path

config.load_autoconfig(False)

palette = Path(__file__).resolve().parent / "matugen.py"
try:
    spec = importlib.util.spec_from_file_location("qb_matugen", palette)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    C = module.QB
except Exception:
    C = {
        "bg": "#16161e", "fg": "#c0caf5",
        "on_surface": "#c0caf5",
        "background": "#1a1b26", "on_background": "#c0caf5",
        "surface": "#16161e", "container": "#2f334d",
        "container_low": "#1a1b26", "container_high": "#3b4261",
        "container_highest": "#444b6a", "on_surface_variant": "#565f89",
        "primary": "#7aa2f7", "on_primary": "#16161e",
        "primary_container": "#3d59a1", "on_primary_container": "#c0caf5",
        "secondary": "#bb9af7", "on_secondary": "#16161e",
        "secondary_container": "#9d7cd8", "on_secondary_container": "#c0caf5",
        "tertiary": "#7dcfff", "on_tertiary": "#16161e",
        "error": "#f7768e", "on_error": "#16161e",
        "outline": "#565f89", "outline_variant": "#3b4261",
        "shadow": "#000000",
    }

c.fonts.default_family = ["JetBrainsMono Nerd Font", "monospace"]
c.fonts.default_size = "11pt"

c.url.start_pages = "https://refact0r.github.io/re-start/"

c.tabs.position = "top"
c.tabs.show = "multiple"

c.colors.statusbar.normal.bg = C["bg"]
c.colors.statusbar.normal.fg = C["fg"]
c.colors.statusbar.insert.bg = C["primary"]
c.colors.statusbar.insert.fg = C["on_primary"]
c.colors.statusbar.command.bg = C["bg"]
c.colors.statusbar.command.fg = C["fg"]
c.colors.statusbar.url.fg = C["fg"]
c.colors.statusbar.url.hover.fg = C["fg"]
c.colors.statusbar.url.success.http.fg = C["primary"]
c.colors.statusbar.url.success.https.fg = C["primary"]
c.colors.statusbar.url.error.fg = C["error"]
c.colors.statusbar.url.warn.fg = C["tertiary"]
c.colors.statusbar.progress.bg = C["primary"]

c.colors.tabs.bar.bg = C["background"]
c.colors.tabs.selected.even.bg = C["primary"]
c.colors.tabs.selected.even.fg = C["on_primary"]
c.colors.tabs.selected.odd.bg = C["primary"]
c.colors.tabs.selected.odd.fg = C["on_primary"]
c.colors.tabs.even.bg = C["surface"]
c.colors.tabs.even.fg = C["on_surface_variant"]
c.colors.tabs.odd.bg = C["bg"]
c.colors.tabs.odd.fg = C["on_surface_variant"]
c.colors.tabs.pinned.even.bg = C["surface"]
c.colors.tabs.pinned.even.fg = C["on_surface_variant"]
c.colors.tabs.pinned.odd.bg = C["bg"]
c.colors.tabs.pinned.odd.fg = C["on_surface_variant"]
c.colors.tabs.pinned.selected.even.bg = C["primary"]
c.colors.tabs.pinned.selected.even.fg = C["on_primary"]
c.colors.tabs.pinned.selected.odd.bg = C["primary"]
c.colors.tabs.pinned.selected.odd.fg = C["on_primary"]
c.colors.tabs.indicator.start = C["primary"]
c.colors.tabs.indicator.stop = C["tertiary"]
c.colors.tabs.indicator.error = C["error"]

c.colors.downloads.bar.bg = C["bg"]
c.colors.downloads.start.bg = C["primary"]
c.colors.downloads.start.fg = C["on_primary"]
c.colors.downloads.stop.bg = C["tertiary"]
c.colors.downloads.stop.fg = C["on_tertiary"]
c.colors.downloads.error.bg = C["error"]
c.colors.downloads.error.fg = C["on_error"]

c.colors.completion.fg = C["on_surface"]
c.colors.completion.category.bg = C["container"]
c.colors.completion.category.fg = C["on_surface_variant"]
c.colors.completion.category.border.top = C["outline_variant"]
c.colors.completion.category.border.bottom = C["outline_variant"]
c.colors.completion.even.bg = C["surface"]
c.colors.completion.odd.bg = C["bg"]
c.colors.completion.item.selected.bg = C["primary_container"]
c.colors.completion.item.selected.fg = C["on_primary_container"]
c.colors.completion.item.selected.border.top = C["outline"]
c.colors.completion.item.selected.border.bottom = C["outline"]
c.colors.completion.item.selected.match.fg = C["tertiary"]
c.colors.completion.match.fg = C["primary"]
c.colors.completion.scrollbar.bg = C["bg"]
c.colors.completion.scrollbar.fg = C["on_surface_variant"]

c.colors.hints.bg = C["primary_container"]
c.colors.hints.fg = C["on_primary_container"]
c.colors.hints.match.fg = C["tertiary"]

c.colors.keyhint.bg = C["container"]
c.colors.keyhint.fg = C["on_surface"]
c.colors.keyhint.suffix.fg = C["primary"]

c.colors.messages.error.bg = C["error"]
c.colors.messages.error.fg = C["on_error"]
c.colors.messages.error.border = C["error"]
c.colors.messages.warning.bg = C["tertiary"]
c.colors.messages.warning.fg = C["on_tertiary"]
c.colors.messages.warning.border = C["tertiary"]
c.colors.messages.info.bg = C["primary"]
c.colors.messages.info.fg = C["on_primary"]
c.colors.messages.info.border = C["primary"]

c.colors.prompts.bg = C["container"]
c.colors.prompts.fg = C["on_surface"]
c.colors.prompts.border = C["outline_variant"]
c.colors.prompts.selected.bg = C["primary"]
c.colors.prompts.selected.fg = C["on_primary"]

c.colors.contextmenu.disabled.bg = C["surface"]
c.colors.contextmenu.disabled.fg = C["on_surface_variant"]
c.colors.contextmenu.menu.bg = C["surface"]
c.colors.contextmenu.menu.fg = C["on_surface"]
c.colors.contextmenu.selected.bg = C["primary"]
c.colors.contextmenu.selected.fg = C["on_primary"]

c.colors.webpage.bg = C["background"]
c.colors.webpage.preferred_color_scheme = "dark"

for i in range(1, 9):
    config.bind(f"<Ctrl-{i}>", f"tab-focus {i}")
    config.unbind(f"<Alt-{i}>")
config.bind("<Ctrl-9>", "tab-focus -1")
config.unbind("<Alt-9>")
config.bind("<Ctrl-0>", "tab-focus 10")

config.bind("zz", "spawn --userscript qute-bitwarden")
config.bind("zz", "spawn --userscript qute-bitwarden", mode="insert")