module Scene
  class Opening < Scene::Base
    def initialize
      super
      @touch_sound = Sound.new("#{$PATH}/lib/sounds/title_button_touch.wav")
      @click_sound = Sound.new("#{$PATH}/lib/sounds/title_button_click.wav")

      darklategrey = [34, 43, 56]
      button_front = Image.new(480, 180, darklategrey)
      mini_fornt = Image.new(300, 128, darklategrey)

      @Select = Sprite.new(Window.width / 2 - button_front.width / 2 , Window.height / 2 - button_front.height / 2, button_front)
      @Exit = Sprite.new(Window.width / 2 - mini_fornt.width / 2, Window.height / 3 * 2 , mini_fornt)

      @Select_check = false
      @Exit_check = false
      @next_scene = nil
    end

    def update
      super
      @Select.draw
      Window.draw_font(Window.width / 2 - 120, Window.height / 2 - 30, "GameStart!", Font.new(56))
      if @Select === @mouse && !@Select_check
        @Select_check = true
        @touch_sound.play
      elsif @Select === @mouse && @Select_check
        @Select_check = true
      else
        @Select_check = false
      end

      @Exit.draw
      Window.draw_font(Window.width / 2 - 40, Window.height / 2 + 200, "Exit", Font.new(48))
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
          @is_finish = true
        elsif @mouse === @Exit_check
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
