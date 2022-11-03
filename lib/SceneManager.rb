class SceneManager
  def initialize
    @scene = Scene::Opening.new
    darklategrey = [34, 43, 56]
    Window.bgcolor = darklategrey
  end

  def update
    begin
    @scene.update
    rescue => e
    end
    @scene = @scene.next_scene if @scene.is_finish
    Window.close unless @scene
  end
end