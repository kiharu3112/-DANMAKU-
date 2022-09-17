module Scene
  class Result1 < Scene::Result
    def initialize(count, player_health)
      super
    end

    def update
      super
    end

    def win
      if Input.mouse_push?(M_LBUTTON)
        @next_button = Scene::Stage2.new
      end
    end

    def lose
      if Input.mouse_push?(M_LBUTTON)
        @next_button = Scene::Stage2.new
      end
    end

    def next_scene
      super
    end

    def finish?
      super
    end
  end
end
