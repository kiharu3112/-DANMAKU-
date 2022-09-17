module Scene
  class Result
    def initialize(count, player_health)
      if player_health >= 1
        @win = :true
      else
        @ein = false
      end
      @count = count
      @next_scene = nil
      @finish = false
      @mouse = Fixture::Mouse.new
      @next_button = Sprite.new(Window.width - 350,Window.height -  130, Image.new(300, 100, C_WHITE))
    end

    def update
      @mouse.update
      @next_button.draw
      if @win
        win
      else
        lose
      end


    end

    def win

    end

    def lose

    end

    def next_scene
      @next_scene
    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @finish
    end
  end
end
