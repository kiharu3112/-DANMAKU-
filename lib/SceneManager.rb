class SceneManager
  def initialize
    @scene = Scene::Result.new(1,1)
  end

  def update
    @scene.update
    @scene = @scene.next_scene if @scene.finish?
    Window.close unless @scene
  end
end