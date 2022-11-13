module Scene
  class Select_Stage < Scene::Base
    def initialize
      super
      @en_endless_normal = Image.load("#{$PATH}/lib/images/select/en_endless_normal.png")
      @en_endless_select = Image.load("#{$PATH}/lib/images/select/en_endless_select.png")
      @en_story_normal = Image.load("#{$PATH}/lib/images/select/en_story_normal.png")
      @en_story_select = Image.load("#{$PATH}/lib/images/select/en_story_select.png")
      @ja_endless_normal = Image.load("#{$PATH}/lib/images/select/ja_endless_normal.png")
      @ja_endless_select = Image.load("#{$PATH}/lib/images/select/ja_endless_select.png")
      @ja_story_normal = Image.load("#{$PATH}/lib/images/select/ja_story_normal.png")
      @ja_story_select = Image.load("#{$PATH}/lib/images/select/ja_story_select.png")
      @select = 0
    end

    def update
      super
      @select = 0 if Input.pad_push?(0) || Input.pad_push?(20) || Input.key_push?(K_LEFTARROW) || Input.key_push?(K_A)
      @select = 1 if Input.pad_push?(1) || Input.pad_push?(21) || Input.key_push?(K_RIGHTARROW) || Input.key_push?(K_D)
      if Input.key_push?(K_RETURN) || Input.key_push?(K_SPACE) || Input.pad_push?(5)
        @is_finish = true
        @next_scene = Scene::Stages::Stage1.new if @select == 0
        @next_scene = Scene::Stages::Endless.new if @select == 1
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
    end
  end
end
