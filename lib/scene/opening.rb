module Scene
  class Opening < Scene::Base
    def initialize
      @touch_sound = Sound.new("#{$PATH}/lib/sounds/title_button_touch.wav")
      @click_sound = Sound.new("#{$PATH}/lib/sounds/title_button_click.wav")

      darklategrey = [34, 43, 56]
      button_front = Image.new(300, 100, darklategrey)
      mini_fornt = Image.new(200, 70, darklategrey)

      @Select = Sprite.new(Window.width / 2 - button_front.width / 2 , Window.height / 2 - button_front.height / 2, button_front)
      @Exit = Sprite.new(Window.width / 2 - mini_fornt.width / 2, Window.height / 3 * 2 , mini_fornt)

      @Select_check = false
      @Exit_check = false
      @next_scene = nil
      @finish = false
    end

    def update
      @Select.draw
      Window.draw_font(Window.width / 2 - 120, Window.height / 2 - 30, "GameStart!", Font.new(56))
      if @Select === $mouse && !@Select_check
        @Select_check = true
        @touch_sound.play
      elsif @Select === $mouse && @Select_check
        @Select_check = true
      else
        @Select_check = false
      end

      @Exit.draw
      Window.draw_font(Window.width / 2 - 40, Window.height / 2 + 120, "Exit", Font.new(48))
      if @Exit === $mouse && !@Exit_check
        @Exit_check = true
        @touch_sound.play
      elsif @Exit === $mouse && @Exit_check
        @Exit_check = true
      else
        @Exit_check = false
      end

      if Input.mouse_push?(M_LBUTTON)
        if $mouse === @Select
          @next_scene = Scene::Select.new
          @finish = true
        elsif $mouse === @Exit_check
          @next_scene = nil
          @finish = true
        end
      end
    end

    def finish?
      return true if Input.key_push?(K_ESCAPE)
      @finish
    end

    def next_scene
      @next_scene
    end
  end
end
