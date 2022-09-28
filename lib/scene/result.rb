module Scene
  class Result
    def initialize(player_health, stage_num)
      if player_health >= 1
        @win = :true
      else
        @win = false
      end
      #@next_button = Sprite.new(Window.width - 350,Window.height -  130, Image.new(300, 100, C_WHITE))
      @next_button_image = Image.new(430, 50, [0,0,0,0])
      @next_button = Sprite.new(Window.width / 2 - 180, Window.height / 3 * 2 - 10, @next_button_image)
      @stage_num = stage_num
      @next_scene = nil
      @is_finish = false
      @mouse = Fixture::Mouse.new
      @stages = [
        Scene::Stage1.new,
        Scene::Stage2.new,
        Scene::Stage3.new
      ]
      @font = 'x8y12pxTheStrongGamer'
      @score_count = 0
      @count = 0
      @touch = false
    end

    def update
      @touch = false
      @next_button.draw
      @touch = true if @next_button === @mouse

      @count += 1
      if @score_count < $score && @count % 2 == 0 && @count > 60
        @score_count += 1
      end
      Window.draw_font(Window.width / 2 - 200, Window.height / 4, "SCORE IS : #{@score_count}", Font.new(64, @font))
      @mouse.update
      if @win
        win
      else
        lose
      end
    end

    def win
      Window.draw_font(Window.width / 2 - 180, Window.height / 3 * 2 - 30, "Next Stage", Font.new(64, @font))
      Window.draw(Window.width / 2 - 180, Window.height / 3 * 2 + 35, Image.new(430, 3, C_WHITE)) if @touch
      if Input.mouse_push?(M_LBUTTON) && @touch
        @next_scene = @stages[@stage_num]
        @is_finish = true
      end
    end

    def lose
      Window.draw_font(Window.width / 2 - 180, Window.height / 3 * 2 - 30, "Next Scene", Font.new(64, @font))
      Window.draw(Window.width / 2 - 180, Window.height / 3 * 2 + 35, Image.new(430, 3, C_WHITE)) if @touch
      if Input.mouse_push?(M_LBUTTON) && @touch
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
