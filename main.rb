require 'dxruby'
require 'json'
require 'time'
Dir[
  'lib/*.rb',
  'lib/fixtures/stage/*.rb',
  'lib/scene/*.rb',
  'lib/fixtures/*.rb',
  'lib/fixtures/result/*.rb',
  'lib/setting.rb'
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