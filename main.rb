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
$PATH = File.dirname(__FILE__)
$mouse = Mouse.new
scenemanager = SceneManager.new
Window.loop do
  $mouse.update
  scenemanager.update
end