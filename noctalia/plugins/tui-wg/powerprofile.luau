local profiles = { "power-saver", "balanced", "performance" }

local function refresh()
  noctalia.runAsync("powerprofilesctl get", function(result)
    if result.exitCode == 0 then
      barWidget.setText("prof: " .. result.stdout:gsub("%s+$", ""))
    else
      barWidget.setText("prof: ERR")
    end
  end)
end

function update()
  noctalia.setUpdateInterval(1000)
  refresh()
end

function onClick()
  noctalia.runAsync("powerprofilesctl get", function(result)
    if result.exitCode == 0 then
      local current = result.stdout:gsub("%s+$", "")
      for i, profile in ipairs(profiles) do
        if profile == current then
          local nextProfile = profiles[i % #profiles + 1]
          noctalia.runAsync("powerprofilesctl set " .. nextProfile, refresh)
          break
        end
      end
    end
  end)
end
