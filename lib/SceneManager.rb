class SceneManager
  def initialize
    @scene = Scene::Opening.new
    darklategrey = [34, 43, 56]
    Window.bgcolor = darklategrey
    $bgm = Sound.new("#{$path}/lib/sounds/opening.mid")
    $bgm.play.set_volume($volume) 
  end
  def start
    Window.loop do
      @scene.update
      @scene = @scene.next_scene if @scene.is_finish
      Window.close unless @scene
    end
  end
end
