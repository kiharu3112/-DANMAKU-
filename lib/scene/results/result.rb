module Scene
  module Results
    class Result_Base < Scene::Base
      include Fixture
      attr_accessor :name, :endless
      def initialize
        super
        @endless = false
        @gold = [255, 215, 0]
        @select = 0 # next_stage = 0, retire = 1
        @score_count = 0
        @click_sound = Sound.new("#{$path}/lib/sounds/title_button_click.wav")
      end

      def update
        super
        @score_count += 1 if @score_count < $score
        win if $health > 0
        lose if $health <= 0
      end

      def win
        @select = 0 if Input.key_push?(K_W) || Input.pad_push?(22) || Input.key_push?(K_UPARROW)
        @select = 1 if Input.key_push?(K_S) || Input.pad_push?(23) || Input.key_push?(K_DOWNARROW)
        Window.draw(0, 0, @win_background)
        Window.draw_font(Window.width / 2 - 170, Window.height / 2  - 60, "SCORE IS : #{@score_count}", Font.new(48, @Font), option={ color:@gold})
        Window.draw_font(Window.width / 2 - 330, Window.height / 2  - 330, "Stage Clear!", Font.new(100, @Font), option={ color:@gold})
        if /.NameInput./ =~ @next_scene.to_s
          Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, @gold)) if @select == 0
          Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Scene", Font.new(64, @Font), option={ color:@gold})
          if @count == 2
            $bgm.stop
            $bgm.dispose
            $bgm = Sound.new("#{$path}/lib/sounds/win_bgm.mid")
            $bgm.play.set_volume($volume)
            puts "sound"
          end
        else
          Window.draw_font(Window.width / 2 - 100, Window.height / 3 * 2 + 100, "Retire", Font.new(48, @Font), option={ color:@gold})
          Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Stage", Font.new(64, @Font), option={ color:@gold})
          Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, @gold)) if @select == 0
          Window.draw(Window.width / 2 - 100, Window.height / 3 * 2 + 150, Image.new(190, 3, @gold)) if @select == 1
        end
        if Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
          @is_finish = true
          @click_sound.play
        end
      end

      def lose
        Window.draw(0, 0, @lose_background)
        Window.draw_font(Window.width / 2 - 220, Window.height / 2  - 280, "You down", Font.new(100, @Font), option={ color:@gold})
        if Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
          @next_scene = Scene::Opening.new
          @is_finish = true
          if @endless
            @next_scene = Scene::NameInput.new 
            @next_scene.rank = true
          end
        end
      end

      def draw_button_lose
        Window.draw_font(Window.width / 2 - 220, Window.height / 3 * 2 - 30, ">>Next Scene", Font.new(64, @Font))
        Window.draw(Window.width / 2 - 220, Window.height / 3 * 2 + 35, Image.new(510, 3, C_WHITE))
        Window.draw_font(Window.width / 2 - 100, Window.height - 200, "Please click any key", Font.new(48, @Font))
      end
    end
  end
end