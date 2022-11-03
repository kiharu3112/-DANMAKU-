module Scene
  class Credit < Scene::Base
    def initialize
      @is_finish = false
      @next_scene = nil
      @font = 'x8y12pxTheStrongGamer'
      @motion = 0
    end

    def update
    end

    def finish?
      super
    end

    def next_scene
      @next_scene
    end
  end
end