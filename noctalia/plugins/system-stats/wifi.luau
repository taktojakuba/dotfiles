function update()
  noctalia.setUpdateInterval(100)

  noctalia.runAsync(
    noctalia.expandPath("~/.config/noctalia/plugins/system-stats/wifi.sh"),
    function(result)
      if result.exitCode == 0 then
        local wifi = result.stdout:gsub("%s+$", "")
        barWidget.setText("wifi: " .. wifi)
      else
        barWidget.setText("wifi: ERR")
      end
    end
  )
end

