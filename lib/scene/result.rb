module Scene
  class Result
    def initialize(player_health, stage_num)
      if player_health >= 1
        @win = :true
      else
        @win = false
      end
      @next_button = Sprite.new(Window.width - 350,Window.height -  130, Image.new(300, 100, C_WHITE))
      @stage_num = stage_num
      @next_scene = nil
      @is_finish = false
      @mouse = Fixture::Mouse.new
      @stages = [
        Scene::Stage1.new,
        Scene::Stage2.new,
        Scene::Stage3.new
      ]
      @score_count = 0
      @count = 0
    end

    def update
      @count += 1
      if @score_count < $score && @count % 2 == 0 && @count > 60
        @score_count += 1
      end
      Window.draw_font(Window.width / 2 - 200, Window.height / 4, "SCORE IS : #{@score_count}", Font.new(64, 'Westminster'))
      @mouse.update
      if @win
        win
      else
        lose
      end
      @next_button.draw
    end

    def win
      if Input.mouse_push?(M_LBUTTON) && @mouse === @next_button
        @next_scene = @stages[@stage_num]
        @is_finish = true
      end
    end

    def lose
      if Input.mouse_push?(M_LBUTTON)
        @next_scene = Scene::NameInput.new
        @is_finish = true
      end
    end

    def next_scene
      @next_scene
    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @is_finish
    end
  end
end
