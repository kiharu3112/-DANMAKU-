module Scene
  class Result
    include Fixture
    attr_reader :is_finish, :next_scene
    def initialize(stage_num)
      if stage_num >= 6
        @next_scene = Scene::NameInput.new
        @is_finish = true
      elsif  $health >= 1
        @win = :true
      else
        @win = false
      end

      @stage_num = stage_num
      @select = 0 # next_stage = 0, retire = 1
      @is_finish = false
      @font = 'x8y12pxTheStrongGamer'
      @score_count = 0
      @count = 0
      @next_scene = Scene::NameInput.new
      next_button_image = Image.new(520, 50, [0,0,0,0])
      @next_button = Sprite.new(Window.width / 2 - 240, Window.height / 3 * 2 - 10, next_button_image)
      retire_image = Image.new(190, 45, [0,0,0,0])
      @retire_button = Sprite.new(Window.width / 2 - 100, Window.height / 3 * 2 + 110, retire_image)
      @stages = [
        Scene::Stage1.new,
        Scene::Stage2.new,
        Scene::Stage3.new,
        Scene::Stage4.new,
        Scene::Stage5.new,
        Scene::Stage6.new
      ]

      @next_scene_button = Sprite.new(Window.width / 2 - 220, Window.height / 3 * 2 - 10, Image.new(520, 45, [0,0,0,0]))
    end

    def update
      Window.close if Input.key_down?(K_ESCAPE)
      @count += 1
      if @score_count < $score && @count > 60
        @score_count += 1
      end

      Window.draw_font(Window.width / 2 - 170, Window.height / 2  - 60, "SCORE IS : #{@score_count}", Font.new(48, @font))
      if @win
        win
      else
        lose_or_comp
      end
    end

    def win
      @select = 0 if Input.key_push?(K_W)
      @select = 1 if Input.key_push?(K_S)

      Window.draw_font(Window.width / 2 - 330, Window.height / 2  - 280, "Stage Clear!", Font.new(100, @font))
      @next_button.draw
      Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Stage", Font.new(64, @font)) if @stage_num != 6
      Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Last Stage", Font.new(64, @font)) if @stage_num == 6
      Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, C_WHITE)) if @select == 0

      @retire_button.draw
      @retire_touch = true if @select == 1
      Window.draw_font(Window.width / 2 - 100, Window.height / 3 * 2 + 100, "Retire", Font.new(48, @font))
      Window.draw(Window.width / 2 - 100, Window.height / 3 * 2 + 150, Image.new(190, 3, C_WHITE)) if @select == 1

      if Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
        @is_finish = true
        case @select
        when 0
          @next_scene = @stages[@stage_num]
        when 1
        else
          # type code here
        end
      end
    end

    def lose_or_comp
      Window.draw_font(Window.width / 2 - 220, Window.height / 2  - 280, "You down", Font.new(100, @font))
      @next_scene_button.draw
      Window.draw_font(Window.width / 2 - 220, Window.height / 3 * 2 - 30, ">>Next Scene", Font.new(64, @font))
      Window.draw(Window.width / 2 - 220, Window.height / 3 * 2 + 35, Image.new(510, 3, C_WHITE))
      Window.draw_font(Window.width / 2 - 100, Window.height - 100, "Please click any key", Font.new(32, @font))

      @is_finish = true if input
    end
  end
end