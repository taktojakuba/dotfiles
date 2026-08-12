function update()
  noctalia.setUpdateInterval(100)

  noctalia.runAsync("wpctl get-volume @DEFAULT_AUDIO_SINK@", function(result)
    if result.exitCode == 0 then
      local out = result.stdout
      if out:find("MUTED") then
        barWidget.setText("vol: Muted")
      else
        local num = tonumber(out:match("(%d+%.?%d*)"))
        if num then
          barWidget.setText("vol: " .. math.floor(num * 100 + 0.5) .. "%")
        else
          barWidget.setText("vol: ERR")
        end
      end
    else
      barWidget.setText("vol: ERR")
    end
  end)
end
