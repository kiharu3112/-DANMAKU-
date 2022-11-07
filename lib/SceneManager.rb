class SceneManager
  def initialize
    @scene = Scene::Stage1.new
    darklategrey = [34, 43, 56]
    Window.bgcolor = darklategrey
  end

  def start
    Window.loop do
      @scene.update
      @scene = @scene.next_scene if @scene.is_finish
      Window.close unless @scene
    end
  end
end