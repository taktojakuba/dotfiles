function update()
  noctalia.setUpdateInterval(100000)
  local location = noctalia.getConfig("location") or "Warsaw"

  noctalia.http({
    url = "https://wttr.in/" .. location .. "?format=%C",
  }, function(resp)
    if resp.ok then
      barWidget.setText("weather: " .. resp.body:gsub("%s+$", ""))
    else
      barWidget.setText("weather: ERR")
    end
  end)
end
