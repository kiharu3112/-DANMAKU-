module Scene
  module Stages
    class Stage6 < Scene::Stages::Stage
      def initialize
        super
        @next_scene = Scene::Results::Result6.new
        @enemy_num = 9
      end

      def game
        super
        begin
          if (@enemies.count <= 0  && @count > 1450) || $health <= 0
            @scene = :end
            @player.image = @player.normal_image
          end  
        rescue => e
          puts e
        end
        
        
        case @count
        when 0
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 450
          @enemies << Enemy_2.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
        when 1200
          $bgm.stop
          $bgm.dispose
          $bgm = Sound.new("#{$path}/lib/sounds/boss_bgm.mid")
          $bgm.play
          @enemies << Enemy_3.new(Window.width / 2 - 20 / 2, -100)
        end
      end
    end
  end
end