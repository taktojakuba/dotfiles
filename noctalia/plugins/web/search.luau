local query = ""

function onQuery(text)
  query = text

  if text == "" then
    launcher.setResults(text, {
      { id = "hint", title = "Type a search query" }
    })
    return
  end

  launcher.setResults(text, {
    {
      id = "search",
      title = "Search the web for \"" .. text .. "\"",
      glyph = "search",
    }
  })
end

function onActivate(id)
  if id == "search" then
    local url = "https://duckduckgo.com/?q=" .. noctalia.string.urlEncode(query)
    noctalia.runAsync("xdg-open " .. url)
  end
end
