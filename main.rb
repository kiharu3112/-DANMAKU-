require 'dxruby'
require 'json'
require 'time'
Dir[
  'lib/*.rb',
  'lib/fixtures/stage/*.rb',
  'lib/scene/*.rb',
  'lib/fixtures/*.rb',
  'lib/fixtures/result/*.rb',
  'lib/scene/results/*.rb',
  'lib/scene/stages/*.rb'
].each do |file|
  require_relative file
end
$PATH = File.dirname(__FILE__)
$lnag = "ja"
$score = 0
Font.install("#{$PATH}/lib/fixtures/font/x8y12pxTheStrongGamer.ttf")
SceneManager.new.start