module Scene
  class Guide < Scene::Base
    def initialize
      super
      @next_scene = Scene::Opening.new
    end
    def update
      super
    end
  end
end
