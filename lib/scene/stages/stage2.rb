module Scene
  module Stages
    class Stage2 < Scene::Stages::Stage
      def initialize
        super
        @next_scene = Scene::Results::Result2.new
        @enemy_num = 12
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
        when 450
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 500
          @enemies << Enemy_1.new(@player.x + 200, -200)
          @enemies << Enemy_1.new(@player.x - 200, -200)
        when 600
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 1000
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        end
      end
    end
  end
end
