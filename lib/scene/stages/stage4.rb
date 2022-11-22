module Scene
  module Stages
    class Stage4 < Scene::Stages::Stage
      def initialize
        super
        @next_scene = Scene::Results::Result4.new
        @enemy_num = 9
      end
      def game
        super
        if (@enemies.count <= 0  && @count > 450) || $health <= 0
          @scene = :end
          @player.image = @player.normal_image
        end
        case @count
        when 0
          @enemies << Enemy_2.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
        when 450
          @items << Repaire_Box.new(rand(100..Window.width - 100), -20)
          @enemies << Enemy_1.new(Window.width / 2, - 150)
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        end
      end
    end
  end
end
