function update()
  noctalia.setUpdateInterval(1000)

  noctalia.runAsync(
    noctalia.expandPath("~/.config/noctalia/plugins/system-stats/powerprofile.sh"),
    function(result)
      if result.exitCode == 0 then
        local profile = result.stdout:gsub("%s+$", "")
        barWidget.setText("prof: " .. profile)
      else
        barWidget.setText("power: ERR")
      end
    end
  )
end

