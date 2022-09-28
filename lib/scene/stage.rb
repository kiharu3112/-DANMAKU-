module Scene
  class Stage < Scene::Base
    def initialize
      super
      @next_scene = nil
      @is_finish = false
      @enemies = []
      @scene = :start
      @mosue = Fixture::Mouse.new
    end

    def update
      super
      @mouse.update
      start if @scene == :start
      game if @scene == :game
      end_scene if @scene == :end
    end

    def start

    end

    def game
      Window.draw_font(Window.width - 300, 100, "score : #{$score}", Font.new(48, @font))
    end

    def end_scene
    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @is_finish
    end

    def next_scene
      @next_scene
    end

    def background_move_draw_1
      background_y_pos = @count % Window.height
      Window.draw(0, background_y_pos - Window.height, @background)
      Window.draw(0, background_y_pos, @background)
    end

    def background_move_draw_2
      background_y_pos = (@count * 2) % Window.height
      Window.draw(0, background_y_pos - Window.height, @background)
      Window.draw(0, background_y_pos, @background)
    end

    def just_draw
      Window.draw(0, 0, @background)
    end
  end
end