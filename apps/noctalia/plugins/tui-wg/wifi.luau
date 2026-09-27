function update()
  noctalia.setUpdateInterval(10000)
  local iface = noctalia.getConfig("wifi_interface") or "wlan0"

  local state = "?"
  local raw = noctalia.readFile("/sys/class/net/" .. iface .. "/operstate")
  if raw then
    state = raw:gsub("%s+$", ""):upper()
  end

  barWidget.setText("wifi: " .. state)
end
