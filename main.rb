require 'dxruby'

Dir[
  'setting.rb',
  'lib/*.rb',
  'lib/scene/*.rb',
  'lib/scene/stages/*.rb',
  'lib/fixtures/*.rb',
].each do |file|
  require_relative file
end
scene = Scene::Opening.new
$PATH = File.dirname(__FILE__)
sky_color = [29, 108, 171]
Window.bgcolor = sky_color
$mouse = Mouse.new
Window.loop do
  $mouse.update
  scene.update
  scene = scene.next_scene if scene.finish?
  Window.close unless scene
end