function update()
  noctalia.setUpdateInterval(5000)

  local battery = "?"
  local names = noctalia.listDir("/sys/class/power_supply")
  if names then
    for _, name in ipairs(names) do
      if name:match("^BAT") then
        local cap = noctalia.readFile("/sys/class/power_supply/" .. name .. "/capacity")
        if cap then
          battery = cap:gsub("%s+$", "") .. "%"
        end
        break
      end
    end
  end

  barWidget.setText("batt: " .. battery)
end
