require 'dxruby'
Dir[
  'lib/*.rb',
  'lib/fixtures/stage1/*.rb',
  'lib/scene/*.rb',
  'lib/scene/stages/*.rb',
  'lib/fixtures/*.rb',
  'lib/fixtures/bullet.rb'
].each do |file|
  require_relative file
end
scene = Scene::Opening.new
$PATH = File.dirname(__FILE__)
$mouse = Mouse.new
Window.loop do
  $mouse.update
  scene.update
  scene = scene.next_scene if scene.finish?
  Window.close unless scene
end