local size = 10

function update()
  noctalia.setUpdateInterval(100)

  noctalia.runAsync("wpctl get-volume @DEFAULT_AUDIO_SINK@", function(result)
    if result.exitCode ~= 0 then
      barWidget.setText("vol: ERR")
      return
    end

    local vol = 0
    local num = tonumber(result.stdout:match("(%d+%.?%d*)"))
    if num then
      vol = math.floor(num * size)
    end

    local line = ""
    for i = 1, size do
      if i <= vol then
        line = line .. "█"
      else
        line = line .. "░"
      end
    end

    barWidget.setText("vol: " .. line)
  end)
end
