module Scene
  class Opening < Scene::Base
    def initialize
      super
      @touch_sound = Sound.new("#{$PATH}/lib/sounds/title_button_touch.wav")
      @click_sound = Sound.new("#{$PATH}/lib/sounds/title_button_click.wav")

      al = [0,0,0,0] # 透明
      button_front = Image.new(470, 45, al)
      mini_fornt = Image.new(300, 40, al)
      micro_font = Image.new(130, 40, al)

      @Select = Sprite.new(Window.width / 2 - button_front.width / 2 , Window.height / 2 - button_front.height / 2 + 40, button_front)
      @Ranking = Sprite.new(Window.width / 2 - mini_fornt.width / 2, Window.height / 3 * 2 + 50, mini_fornt)
      @Exit = Sprite.new(Window.width / 2 - micro_font.width / 2 , Window.height / 4 * 3 + 100, micro_font)
      @Select_check = false
      @Ranking_check = false
      @Exit_check = false
      @next_scene = nil
    end

    def update
      super
      @Select.draw
      Window.draw_font(Window.width / 2 - 230, Window.height / 2, "🎮GameStart!🎮", Font.new(56, @font))
      Window.draw(Window.width / 2 - 230, Window.height / 2 + 60, Image.new(460, 3, C_WHITE)) if @mouse === @Select
      if @Select === @mouse && !@Select_check
        @Select_check = true
        @touch_sound.play
      elsif @Select === @mouse && @Select_check
        @Select_check = true
      else
        @Select_check = false
      end

      @Ranking.draw
      Window.draw_font(Window.width / 2 - 150, Window.height / 2 + 200, "👑Ranking👑", Font.new(48, @font))
      Window.draw(Window.width / 2 - 150, Window.height / 2 + 250, Image.new(300, 3, C_WHITE)) if @mouse === @Ranking
      if @Ranking === @mouse && !@Ranking_check
        @Ranking_check = true
        @touch_sound.play
      elsif @Ranking === @mouse && @Ranking_check
        @Ranking_check = true
      else
        @Ranking_check = false
      end

      @Exit.draw
      Window.draw_font(Window.width / 2 - 65, Window.height / 4 * 3 + 90, "Exit", Font.new(48, @font))
      Window.draw(Window.width / 2 - 65, Window.height / 4 * 3 + 140, Image.new(130, 3, C_WHITE)) if @mouse === @Exit
      if @Exit === @mouse && !@Exit_check
        @Exit_check = true
        @touch_sound.play
      elsif @Exit === @mouse && @Exit_check
        @Exit_check = true
      else
        @Exit_check = false
      end


      if Input.mouse_push?(M_LBUTTON)
        if @mouse === @Select
          @next_scene = Scene::Stage1.new
          $health = 100
          $score = 0
          @is_finish = true
        elsif @mouse === @Ranking
          @next_scene = Scene::Ranking.new
          @is_finish = true
        elsif @mouse === @Exit
          @next_scene = nil
          @is_finish = true
        end
      end
    end

    def finish?
      super
    end

    def next_scene
      @next_scene
    end
  end
end
