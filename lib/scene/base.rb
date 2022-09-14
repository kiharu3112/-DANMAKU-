module Scene
  class Base
    def initialize
      @count = 0
      @background = Image.load("#{$PATH}/lib/images/Sea.png")
    end

    def update
      @count += 1
    end

    def next_scene
      raise NotImplementedError
    end

    def finish?
      raise NotImplementedError
    end

    private

    def move_background_right_and_draw
      background_y_pos = @count % Window.height
      Window.draw(background_y_pos - Window.height, 0, @background)
      Window.draw(background_y_pos, 0, @background)
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