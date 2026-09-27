local prev = nil -- { idle, total } from the previous tick
local pct = 0

function update()
  noctalia.setUpdateInterval(1000)

  local raw = noctalia.readFile("/proc/stat")
  if raw then
    local cpuLine = raw:match("^cpu%s+(.+)")
    if cpuLine then
      local a, b, c, d, e, f, g, h = cpuLine:match("(%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+) (%d+)")
      if a then
        local idle = d + e -- idle + iowait
        local total = a + b + c + d + e + f + g + h
        if prev and total > prev.total then
          local used = 1 - (idle - prev.idle) / (total - prev.total)
          pct = math.max(0, math.min(100, math.floor(used * 100)))
        end
        prev = { idle = idle, total = total }
      end
    end
  end

  barWidget.setText("cpu: " .. pct .. "%")
end
