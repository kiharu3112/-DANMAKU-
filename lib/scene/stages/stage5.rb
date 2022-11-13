module Scene
  module Stages
    class Stage5 < Scene::Stages::Stage
      def initialize
        super
        @next_scene = Scene::Results::Result5.new
        @enemy_num = 9
      end
      def game
        super
        if (@enemies.count <= 0  && @count > 500) || $health <= 0
          @scene = :end
          @player.image = @player.normal_image
        end
        case @count
        when 0
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 500
          @enemies << Enemy_2.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
        when 700
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 1100
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 1500
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 1800
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        end
      end
    end
  end
end

