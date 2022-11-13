module Scene
  module Stages
    class Stage6 < Scene::Stages::Stage
      def initialize
        super
        @next_scene = Scene::Results::Result_Endless.new
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
        when 150
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 220
          @enemies << Enemy_2.new(@player.x - 100, -200)
          @enemies << Enemy_2.new(@player.x + 100, -150)
        when 450
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 650
          @enemies << Enemy_1.new(@player.x - 200, -200)
          @enemies << Enemy_1.new(@player.x + 200, -200)
        when 900
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 1200
          @enemies << Enemy_2.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
        when 1400
          @count = 0
        end
      end
    end
  end
end