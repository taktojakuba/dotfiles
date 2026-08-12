-- Each button's onClick must name a global function declared at load time
-- (the sandbox makes the global table read-only after the script loads).
-- Declare a fixed pool of handlers that read their app from `slots`.
local APPS = {
  { name = "Steam",      cmd = "steam",   proc = "steam" },
  { name = "Vesktop",    cmd = "vesktop", proc = "vesktop" },
  { name = "OBS Studio", cmd = "obs",     proc = "obs" },
  { name = "Discord",    cmd = "discord", proc = "discord" },
  { name = "Spotify",    cmd = "spotify", proc = "spotify" },
}

local slots = {} -- slot index -> app table

local function runSlot(i)
  local app = slots[i]
  if app then
    noctalia.runAsync(app.cmd)
  end
end

function apptrayClick1() runSlot(1) end
function apptrayClick2() runSlot(2) end
function apptrayClick3() runSlot(3) end
function apptrayClick4() runSlot(4) end
function apptrayClick5() runSlot(5) end
function apptrayClick6() runSlot(6) end
function apptrayClick7() runSlot(7) end
function apptrayClick8() runSlot(8) end
function apptrayClick9() runSlot(9) end
function apptrayClick10() runSlot(10) end

local function renderButtons(apps)
  local buttons = {}
  for i, app in ipairs(apps) do
    if i <= 10 then
      slots[i] = app
      table.insert(buttons, ui.button({
        text = app.name,
        variant = "ghost",
        onClick = "apptrayClick" .. i,
      }))
    end
  end

  local container = barWidget.isVertical() and ui.column or ui.row
  if #buttons == 0 then
    barWidget.render(container({ gap = 6, align = "center" }, {
      ui.glyph({ name = "minus", size = 12, color = "on_surface/0.4" }),
    }))
  else
    barWidget.render(container({ gap = 6, align = "center" }, buttons))
  end
end

local function refresh()
  local running = {}

  local function checkApps(i)
    if i > #APPS then
      renderButtons(running)
      return
    end
    local app = APPS[i]
    noctalia.processMatches(function(matched)
      if matched then
        table.insert(running, app)
      end
      checkApps(i + 1)
    end, app.proc)
  end

  checkApps(1)
end

function update()
  noctalia.setUpdateInterval(1000)
  refresh()
end
