require 'dxruby'
require 'json'
Dir[
  'lib/*.rb',
  'lib/fixtures/stage1/*.rb',
  'lib/scene/*.rb',
  'lib/scene/results/*.rb',
  'lib/scene/stages/*.rb',
  'lib/fixtures/*.rb',
  'lib/fixtures/bullet.rb',
  'lib/fixtures/stage2/*.rb',
  'lib/fixtures/stage3/*.rb',
  'lib/fixtures/result/*.rb'
].each do |file|
  require_relative file
end
$PATH = File.dirname(__FILE__)
$score = 0
Font.install("lib/fixtures/setting/x8y12pxTheStrongGamer.ttf")
scenemanager = SceneManager.new
Window.loop do
  scenemanager.update
end