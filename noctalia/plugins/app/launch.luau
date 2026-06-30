local query = ""
local shortcuts = {
  youtube = "https://www.youtube.com",
  yt = "https://www.youtube.com",
  reddit = "https://www.reddit.com",
  gh = "https://www.github.com",
  github = "https://www.github.com",
  x = "https://www.x.com",
  twitter = "https://www.twitter.com",
}
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
      title = "launching " .. text
    }
  })
end

function onActivate(id)
  if id == "search" then
    local url = "https://duckduckgo.com/?q=" .. query:gsub(" ", "+")
      noctalia.runAsync("xdg-open " .. url)
    end
end
