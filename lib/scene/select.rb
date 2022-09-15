module Scene
  class Select < Scene::Base
    def initialize
      super
      @stage_button_image_active = Image.new(360, 120, C_BLUE)
      @stage_button_image_nonactive = Image.new(360, 120, [41, 42, 48])
      @buttons = [
        Sprite.new(Window.width / 3 - @stage_button_image_active.width / 2, Window.height / 5 * 2 - @stage_button_image_active.width / 2 , @stage_button_image_active),
        Sprite.new(Window.width / 3 - @stage_button_image_active.width / 2, Window.height / 5 * 3 - @stage_button_image_active.width / 2, @stage_button_image_active),
        Sprite.new(Window.width / 3 - @stage_button_image_active.width / 2, Window.height / 5 * 4 - @stage_button_image_active.width / 2, @stage_button_image_active),
        Sprite.new(Window.width / 3 * 2 - @stage_button_image_active.width / 2, Window.height / 5 * 2 - @stage_button_image_active.width / 2, @stage_button_image_active),
        Sprite.new(Window.width / 3 * 2 - @stage_button_image_active.width / 2, Window.height / 5 * 3 - @stage_button_image_active.width / 2, @stage_button_image_active),
        Sprite.new(Window.width / 3 * 2 - @stage_button_image_active.width / 2, Window.height / 5 * 4 - @stage_button_image_active.width / 2, @stage_button_image_active),
      ]

      @button_checker = Array.new(6, false)
      @button_touch_sound = Sound.new("#{$PATH}/lib/sounds/title_button_touch.wav")
      @button_click_sound = Sound.new("#{$PATH}/lib/sounds/title_button_click.wav")
      @can_play_stage = 3
    end

    def update
      super
      Window.draw_font(200, 100, "任務を選べ", Font.new(64))
      6.times do |button_num|
        if button_num <= @can_play_stage - 1
          @buttons[button_num].image = @stage_button_image_active
        else
          @buttons[button_num].image = @stage_button_image_nonactive
        end
      end
      Sprite.draw(@buttons)
      6.times do |button_num|
        Window.draw_font(@buttons[button_num].x + 10, @buttons [button_num].y + 20, "stage#{button_num + 1}", Font.new(46, 'nicoca'))
      end


      6.times do|button_num|
        if @buttons[button_num] === $mouse && !@button_checker[button_num]
          @button_checker[button_num] = true
          @button_touch_sound.play
        elsif @buttons[button_num] === $mouse
          @button_checker[button_num] = true
        else
          @button_checker[button_num] = false
        end
      end

      if Input.mouse_push?(M_LBUTTON)
        @next_scene = Scene::Stage1.new  if @mouse === @buttons[0] && @can_play_stage >= 1
        @next_scene = Scene::Stage2.new  if @mouse === @buttons[1] && @can_play_stage >= 2
        @next_scene = Scene::Stage3.new  if @mouse === @buttons[2] && @can_play_stage >= 3
        @next_scene = Scene::Stage4.new  if @mouse === @buttons[3] && @can_play_stage >= 4
        @next_scene = Scene::Stage5.new  if @mouse === @buttons[4] && @can_play_stage >= 5
        @next_scene = Scene::Stage6.new  if @mouse === @buttons[5] && @can_play_stage >= 6
        if @mouse === @buttons
          @button_click_sound.play
          @is_finish = true
        end
      end
    end

    def finish?
      @is_finish
    end

    def next_scene
      @next_scene
    end
  end
end