class SceneManager
  def initialize
    @scene = Scene::Result.new(1, 1)
    darklategrey = [34, 43, 56]
    Window.bgcolor = darklategrey
  end

  def update
    @scene.update
    @scene = @scene.next_scene if @scene.finish?
    Window.close unless @scene
  end
end