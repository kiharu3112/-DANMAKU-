module Scene
  class Option < Scene::Base
    def initialize
      super
      @next_scene = Scene::Opening.new
    end
  end
end
