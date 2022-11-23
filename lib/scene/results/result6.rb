module Scene
  module Results
    class Result6 < Scene::Results::Result_Base
      def initialize
        super
        @win_background = Image.load("#{$path}/lib/images/result/win-picture01.jpg")
        @lose_background = Image.load("#{$path}/lib/images/result/zero_destroyed.png")
        @next_scene = Scene::NameInput.new

        if $health > 0
          $bgm.stop
          $bgm.dispose
          $bgm = Sound.new("#{$path}/lib/sounds/win_bgm.mid")
          $bgm.play
          @next_scene = Scene::NameInput.new
          puts "next"
        end
      end

      def win
        Window.draw(Window.width / 2 - 240, Window.height / 3 * 2 + 35, Image.new(510, 3, @gold)) if @select == 0
        Window.draw(Window.width / 2 - 100, Window.height / 3 * 2 + 150, Image.new(190, 3, @gold))
        Window.draw_font(Window.width / 2 - 330, Window.height / 2  - 330, "Stage Clear!", Font.new(100, @Font), option={ color:@gold})
        Window.draw_font(Window.width / 2 - 170, Window.height / 2  - 60, "SCORE IS : #{@score_count}", Font.new(48, @Font), option={ color:@gold})
        Window.draw_font(Window.width / 2 - 240, Window.height / 3 * 2 - 30, ">>Next Scene", Font.new(64, @Font), option={ color:@gold})
        @is_finish = Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
      end
    end
  end
end