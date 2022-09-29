module Scene
  class Result
    def initialize(player_health, stage_num)
      if stage_num >= 6
        @next_scene = Scene::Ending.new
        @is_finish = true
      elsif  player_health >= 1
        @win = :true
      else
        @win = false
      end
      #@next_button = Sprite.new(Window.width - 350,Window.height -  130, Image.new(300, 100, C_WHITE))
      @next_button_image = Image.new(520, 50, [0,0,0,0])
      @next_button = Sprite.new(Window.width / 2 - 240, Window.height / 3 * 2 - 10, @next_button_image)
      @stage_num = stage_num
      @next_scene = nil
      @is_finish = false
      @mouse = Fixture::Mouse.new
      @font = 'x8y12pxTheStrongGamer'
      @score_count = 0
      @count = 0
      @retire_image = Image.new(190, 45, [0,0,0,0])
      @retire_button = Sprite.new(Window.width / 2 - 100, Window.height / 3 * 2 + 110, @retire_image)
      @stages = [
        Scene::Stage1.new,
        Scene::Stage2.new,
        Scene::Stage3.new,
        Scene::Stage4.new,
        Scene::Stage5.new,
        Scene::Stage6.new
      ]

      @next_scene_button = Sprite.new(Window.width / 2 - 180, Window.height / 3 * 2 - 10, Image.new(425, 45, [0,0,0,0]))
    end

    def update
      @count += 1
      if @score_count < $score && @count % 2 == 0 && @count > 60
        @score_count += 1
      end
      Window.draw_font(Window.width / 2 - 230, Window.height / 4, "SCORE IS : #{@score_count}", Font.new(64, @font))
      @mouse.update
      if @win
        win
      else
        lose
      end
    end

    def win
      @next_button.draw
      @touch = false
      @touch = true if @next_button === @mouse
      Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Stage", Font.new(64, @font))
      Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, C_WHITE)) if @touch
      if Input.mouse_push?(M_LBUTTON) && @touch
        @next_scene = @stages[@stage_num]
        @is_finish = true
      end

      ##################################################################
      @retire_touch = false
      @retire_button.draw
      @retire_touch = true if @mouse === @retire_button
      Window.draw_font(Window.width / 2 - 100, Window.height / 3 * 2 + 100, "Retire", Font.new(48, @font))
      Window.draw(Window.width / 2 - 100, Window.height / 3 * 2 + 150, Image.new(190, 3, C_WHITE)) if @retire_touch
      if Input.mouse_push?(M_LBUTTON) && @retire_touch
        @next_scene = Scene::NameInput.new
        @is_finish = true
      end
    end

    def lose
      @next_scene_button.draw
      @touch = true if @mouse === @next_scene_button
      Window.draw_font(Window.width / 2 - 180, Window.height / 3 * 2 - 30, "Next Scene", Font.new(64, @font))
      Window.draw(Window.width / 2 - 180, Window.height / 3 * 2 + 35, Image.new(425, 3, C_WHITE)) if @touch
      if Input.mouse_push?(M_LBUTTON) && @touch
        @next_scene = Scene::NameInput.new
        @is_finish = true
      end
      @touch = false
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