module Scene
  class Opening < Scene::Base
    def initialize
      super
      @touch_sound = Sound.new("#{$PATH}/lib/sounds/title_button_touch.wav")
      @click_sound = Sound.new("#{$PATH}/lib/sounds/title_button_click.wav")

      al = [0,0,0,0] # 透明
      button_front = Image.new(460, 45, al)
      midi_front = Image.new(300, 38, al)
      mini_front = Image.new(260, 38, al)
      micro_font = Image.new(130, 40, al)

      @start = Sprite.new(Window.width / 2 - button_front.width / 2 + 5, Window.height / 2 - button_front.height / 2 + 40, button_front)
      @ranking = Sprite.new(Window.width / 2 - midi_front.width / 2, Window.height / 3 * 2 - 10, midi_front)
      @credit = Sprite.new(Window.width / 2 - mini_front.width / 2, Window.height / 3 * 2 + 90, mini_front)
      @exit = Sprite.new(Window.width / 2 - midi_front.width / 2 + 80, Window.height / 4 * 3 + 100, micro_font)
      @check_start = false
      @ranking_check = false
      @check_credit = false
      @check_exit = false
    end

    def update
      super
      Window.draw_font(Window.width / 2 - 600, Window.height / 6, "!DANMAKU!", Font.new(200, @font))

      @start.draw
      Window.draw_font(Window.width / 2 - 220, Window.height / 2, "🎮GameStart!🎮", Font.new(56, @font))
      Window.draw(Window.width / 2 - 220, Window.height / 2 + 60, Image.new(460, 3, C_WHITE)) if @mouse === @start
      if @start === @mouse && !@check_start
        @check_start = true
        @touch_sound.play
      elsif @start === @mouse && @check_start
        @check_start = true
      else
        @check_start = false
      end

      @ranking.draw
      Window.draw_font(Window.width / 2 - 150, Window.height / 2 + 140, "👑Ranking👑", Font.new(48, @font))
      Window.draw(Window.width / 2 - 150, Window.height / 2 + 190, Image.new(300, 3, C_WHITE)) if @mouse === @ranking
      if @ranking === @mouse && !@ranking_check
        @ranking_check = true
        @touch_sound.play
      elsif @ranking === @mouse && @ranking_check
        @ranking_check = true
      else
        @ranking_check = false
      end

      @credit.draw
      Window.draw_font(Window.width / 2 - 130, Window.height / 2 + 240, "📃Credit📃", Font.new(48, @font))
      Window.draw(Window.width / 2 - 130, Window.height / 2 + 290, Image.new(260, 3, C_WHITE)) if @mouse === @credit
      if @credit === @mouse && !@check_credit
        @check_credit = true
        @touch_sound.play
      elsif @credit === @mouse && @check_credit
        @check_credit = true
      else
        @check_credit = false
      end

      @exit.draw
      Window.draw_font(Window.width / 2 - 65, Window.height / 4 * 3 + 90, "Exit", Font.new(48, @font))
      Window.draw(Window.width / 2 - 65, Window.height / 4 * 3 + 140, Image.new(130, 3, C_WHITE)) if @mouse === @exit
      if @exit === @mouse && !@check_exit
        @check_exit = true
        @touch_sound.play
      elsif @exit === @mouse && @check_exit
        @check_exit = true
      else
        @check_exit = false
      end


      if Input.mouse_push?(M_LBUTTON)
        if @mouse === @start
          @next_scene = Scene::Stage1.new
          $health = 100
          $score = 0
          @is_finish = true
          @click_sound.play
        elsif @mouse === @ranking
          @next_scene = Scene::Ranking.new
          @is_finish = true
          @click_sound.play
        elsif  @mouse === @credit
          @next_scene = Scene::Credit.new
          @click_sound.play
          @is_finish = true
        elsif @mouse === @exit
          @next_scene = nil
          @click_sound.play
          @is_finish = true
        end
      end
      #draw_line
    end

    def draw_line
      Window.draw(Window.width / 2, 0, Image.new(1, Window.height, C_RED))
      Window.draw(0, Window.height / 2, Image.new(Window.width, 1, C_RED))
    end
  end
end
