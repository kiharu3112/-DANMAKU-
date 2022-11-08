module Scene
  module Results
    class Result_Base < Scene::Base
      include Fixture
      def initialize
        super
        @gold = [255, 215, 0]
        @select = 0 # next_stage = 0, retire = 1
        @score_count = 0
        @next_scene = Scene::NameInput.new
        next_button_image = Image.new(520, 50, [0,0,0,0])
        @next_button = Sprite.new(Window.width / 2 - 240, Window.height / 3 * 2 - 10, next_button_image)
        retire_image = Image.new(190, 45, [0,0,0,0])
        @retire_button = Sprite.new(Window.width / 2 - 100, Window.height / 3 * 2 + 110, retire_image)
        @next_scene_button = Sprite.new(Window.width / 2 - 220, Window.height / 3 * 2 - 10, Image.new(520, 45, [0,0,0,0]))
      end

      def update
        super
        @input = Input.pads
        if @score_count < $score
          @score_count += 1
        end
        win if $health > 0
        lose unless  $health > 0
      end

      def win
        Window.draw(0, 0, @win_background)
        Window.draw_font(Window.width / 2 - 330, Window.height / 2  - 330, "Stage Clear!", Font.new(100, @font), option={color:@gold})

        Window.draw_font(Window.width / 2 - 170, Window.height / 2  - 60, "SCORE IS : #{@score_count}", Font.new(48, @font), option={color:@gold})
        @select = 0 if Input.key_push?(K_W) || Input.pad_push?(22)
        @select = 1 if Input.key_push?(K_S) || Input.pad_push?(23)

        @next_button.draw
        Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Stage", Font.new(64, @font), option={color:@gold}) if @stage_num != 6
        Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Last Stage", Font.new(64, @font), option={color:@gold}) if @stage_num == 6
        Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, @gold)) if @select == 0

        @retire_button.draw
        @retire_touch = true if @select == 1
        Window.draw_font(Window.width / 2 - 100, Window.height / 3 * 2 + 100, "Retire", Font.new(48, @font), option={color:@gold})
        Window.draw(Window.width / 2 - 100, Window.height / 3 * 2 + 150, Image.new(190, 3, @gold)) if @select == 1

        @is_finish = Input.pad_push?(5)
      end

      def lose
        Window.draw(0, 0, @lose_background)
        Window.draw_font(Window.width / 2 - 220, Window.height / 2  - 280, "You down", Font.new(100, @font), option={color:@gold})
        @is_finish = Input.pad_push?(5)
        @next_scene = Scene::NameInput.new
      end

      def draw_button_lose
        @next_scene_button.draw
        Window.draw_font(Window.width / 2 - 220, Window.height / 3 * 2 - 30, ">>Next Scene", Font.new(64, @font))
        Window.draw(Window.width / 2 - 220, Window.height / 3 * 2 + 35, Image.new(510, 3, C_WHITE))
        Window.draw_font(Window.width / 2 - 100, Window.height - 200, "Please click any key", Font.new(48, @font))
      end
    end
  end
end