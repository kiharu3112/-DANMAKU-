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
        if @score_count < $score
          @score_count += 1
        end
        win if $health > 0
        lose unless  $health > 0
      end

      def win
        @select = 0 if Input.key_push?(K_W) || Input.pad_push?(22) || Input.key_push?(K_UPARROW)
        @select = 1 if Input.key_push?(K_S) || Input.pad_push?(23) || Input.key_push?(K_DOWNARROW)

        Window.draw(0, 0, @win_background)
        Window.draw_font(Window.width / 2 - 330, Window.height / 2  - 330, "Stage Clear!", Font.new(100, @Font), option={ color:@gold})

        Window.draw_font(Window.width / 2 - 170, Window.height / 2  - 60, "SCORE IS : #{@score_count}", Font.new(48, @Font), option={ color:@gold})

        @next_button.draw
        @retire_button.draw

        if @select == 0

          Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Stage", Font.new(64, @Font), option={ color:@gold}) if @stage_num != 6
          Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Last Stage", Font.new(64, @Font), option={ color:@gold}) if @stage_num == 6
          Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, @gold))
        else
          @next_scene = Scene::NameInput.new if @select == 1
          Window.draw_font(Window.width / 2 - 100, Window.height / 3 * 2 + 100, "Retire", Font.new(48, @Font), option={ color:@gold})
          Window.draw(Window.width / 2 - 100, Window.height / 3 * 2 + 150, Image.new(190, 3, @gold)) if @select == 1
        end


        @is_finish = Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
      end

      def lose
        Window.draw(0, 0, @lose_background)
        Window.draw_font(Window.width / 2 - 220, Window.height / 2  - 280, "You down", Font.new(100, @Font), option={ color:@gold})
        @is_finish = Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
        @next_scene = Scene::NameInput.new
      end

      def draw_button_lose
        @next_scene_button.draw
        Window.draw_font(Window.width / 2 - 220, Window.height / 3 * 2 - 30, ">>Next Scene", Font.new(64, @Font))
        Window.draw(Window.width / 2 - 220, Window.height / 3 * 2 + 35, Image.new(510, 3, C_WHITE))
        Window.draw_font(Window.width / 2 - 100, Window.height - 200, "Please click any key", Font.new(48, @Font))
      end
    end
  end
end