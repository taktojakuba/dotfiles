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
      title = "searching web for " .. text
    }
  })
end

function onActivate(id)
  if id == "search" then
    local url = "https://duckduckgo.com/?q=" .. query:gsub(" ", "+")
      noctalia.runAsync("xdg-open " .. url)
    end
end
