
module Setting
  Window.width = 1280
  Window.height = 960


  DEFAULT_FONT_SIZE = 24
  TITLE_FONT_SIZE = 48
  Window.caption = "!DANMAKU!"
  Window.bgcolor = C_WHITE
  Window.fps = 60

  File.open("user.json") do |file|
    data = JSON.load(file)
    $lang = data["setting"]["lang"]
    $volume = data["setting"]["volume"]
    file.close
  end
end