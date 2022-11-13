module Scene
  class Select_Stage < Scene::Base
    def initialize
      super
      @en_endless_normal = Image.load("#{$path}/lib/images/select/en_endless_normal.png")
      @en_endless_select = Image.load("#{$path}/lib/images/select/en_endless_select.png")
      @en_story_normal = Image.load("#{$path}/lib/images/select/en_story_normal.png")
      @en_story_select = Image.load("#{$path}/lib/images/select/en_story_select.png")
      @ja_endless_normal = Image.load("#{$path}/lib/images/select/ja_endless_normal.png")
      @ja_endless_select = Image.load("#{$path}/lib/images/select/ja_endless_select.png")
      @ja_story_normal = Image.load("#{$path}/lib/images/select/ja_story_normal.png")
      @ja_story_select = Image.load("#{$path}/lib/images/select/ja_story_select.png")
      @touch_sound = Sound.new("#{$path}/lib/sounds/title_button_touch.wav")
      @click_sound = Sound.new("#{$path}/lib/sounds/title_button_click.wav")
      @select = 0
    end

    def update
      super
      if Input.pad_push?(0) || Input.pad_push?(20) || Input.key_push?(K_LEFTARROW) || Input.key_push?(K_A)
        @touch_sound.play.set_volume($volume)
        @select = 0
      end
      if Input.pad_push?(1) || Input.pad_push?(21) || Input.key_push?(K_RIGHTARROW) || Input.key_push?(K_D)
        @select = 1
        @touch_sound.play.set_volume($volume)
      end
      if Input.key_push?(K_RETURN) || Input.key_push?(K_SPACE) || Input.pad_push?(5)
        @click_sound.play.set_volume($volume)
        @is_finish = true
        @next_scene = Scene::Stages::Stage1.new if @select == 0
        @next_scene = Scene::Stages::Stage_endless.new if @select == 1
      end

      if $lang == "en"
        if @select.zero?
          Window.draw(150, 200, @en_story_select)
          Window.draw(Window.width - 550, 200, @en_endless_normal)
        else
          Window.draw(150, 200, @en_story_normal)
          Window.draw(Window.width - 550, 200, @en_endless_select)
        end
      else
        if @select.zero?
          Window.draw(150, 200, @ja_story_select)
          Window.draw(Window.width - 550, 200, @ja_endless_normal)
        else
          Window.draw(150, 200, @ja_story_normal)
          Window.draw(Window.width - 550, 200, @ja_endless_select)
        end
      end

      if Input.pad_push?(4)
        @click_sound.play.set_volume($volume)
        @is_finish = true
        @next_scene = Scene::Opening.new
      end
    end
  end
end
