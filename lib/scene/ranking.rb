module Scene
  class Ranking
    def initialize(score, name)
      @scroe = score
      @name = name
      @is_finish = false
    end

    def update
      Window.draw_font(100, 100, "Ranking!", Font.new(32))
      if Input.key_push?(K_RETURN)
        @next_scene = Scene::Select.new
        @is_finish = true
      end
    end

    def finish?
      @is_finish
    end

    def next_scene
      @next_scene
    end
  end
end