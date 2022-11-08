module Scene
  module Stages
    class Stage4 < Scene::Stages::Stage
      def initialize
        super
        @next_scene = Scene::Results::Result4.new
        @enemy_num = 9
      end

      def update
        super
      end

      def start
        super
      end

      def game
        super
        case @count
        when 0
          @enemies << Enemy_2.new(Window.width / 4, -200)
          @enemies << Enemy_2.new(Window.width / 2, -150)
          @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
        end
      end

      def end_scene
        super
      end

      def finish?
        super
      end

      def next_scene
        super
      end
    end

  end
end
