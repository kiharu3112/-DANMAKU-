require 'dxruby'
Dir[
  'lib/*.rb',
  'lib/fixtures/stage1/*.rb',
  'lib/scene/*.rb',
  'lib/scene/stages/*.rb',
  'lib/fixtures/*.rb',
  'lib/fixtures/bullet.rb',
  'lib/fixtures/stage2/*.rb',
  'lib/fixtures/stage3/*.rb',
  'lib/scene/results/*.rb',
  'lib/fixtures/result/*.rb'
].each do |file|
  require_relative file
end
$PATH = File.dirname(__FILE__)
scenemanager = SceneManager.new
Window.loop do
  scenemanager.update
end