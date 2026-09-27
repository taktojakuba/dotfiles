function update()
  noctalia.setUpdateInterval(1000)

  local pct = "?"
  local raw = noctalia.readFile("/proc/meminfo")
  if raw then
    local total = tonumber(raw:match("MemTotal:%s+(%d+)"))
    local avail = tonumber(raw:match("MemAvailable:%s+(%d+)"))
    if total and avail then
      pct = string.format("%.0f%%", (1 - avail / total) * 100)
    end
  end

  barWidget.setText("ram: " .. pct)
end
