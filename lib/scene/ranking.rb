module Scene
  class Ranking < Scene::Base
    def initialize
      @is_finish = false
      @next_scene = nil
    end

    def update
      Window.draw_font(100, 100, "Ranking!", Font.new(32, @base_font))
      if Input.key_push?(K_RETURN)
        @next_scene = Scene::Opening.new
        @is_finish = true
      end
    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @is_finish
    end

    def next_scene
      @next_scene
    end
  end
end