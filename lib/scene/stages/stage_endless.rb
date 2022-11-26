module Scene
  module Stages
    class Stage_endless < Scene::Stages::Stage
      def initialize
        super
        $health = 100
        @fase = 0
        @endless = true
      end

      def game
        super
        Window.draw_font(Window.width - 300, 100, "score : #{$score}", Font.new(36, @Font))
        if $health <= 0
          @is_finish = true
          @next_scene = Scene::Results::Result_Endless.new
        end
        case @fase
        when 0
          case @count
          when 0
            @enemies << Enemy_1.new(Window.width / 4, - 200)
            @enemies << Enemy_1.new(Window.width / 2, - 150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, - 200)
          when 450
            @enemies << Enemy_1.new(Window.width / 4, -200)
            @enemies << Enemy_2.new(Window.width / 2, -150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            @items << Repaire_Box.new(rand(200..900), -20)
          when 900
            @enemies << Enemy_1.new(Window.width / 4, -200)
            @enemies << Enemy_1.new(Window.width / 2, -150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
          when 1350
            @enemies << Enemy_2.new(Window.width / 4, -200)
            @enemies << Enemy_2.new(Window.width / 2, -150)
            @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
          when 1500
            @enemies << Enemy_2.new(Window.width / 4, -200)
            @enemies << Enemy_2.new(Window.width / 2, -150)
            @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
            @enemies << Enemy_1.new(200, - 200)
            @enemies << Enemy_1.new(Window.width - 200, - 200)
          when 1800
            @count = -1
            @fase = 1
          end
        when 1
          case @count
          when 0
            @enemies << Enemy_1.new(300, -100)
            @enemies << Enemy_1.new(Window.width - 300, - 100)
          when 450
            @enemies << Enemy_2.new(300, - 100)
            @enemies << Enemy_2.new(Window.width - 300, - 100)
          when 900
            @enemies << Enemy_1.new(Window.width / 4, -200)
            @enemies << Enemy_1.new(Window.width / 2, -150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            @enemies << Enemy_1.new(200, - 250)
            @enemies << Enemy_1.new(Window.width - 200, - 250)
          when 1000
            @enemies << Enemy_1.new(Window.width / 4, -200)
            @enemies << Enemy_1.new(Window.width / 2, -150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            @enemies << Enemy_1.new(200, - 250)
            @enemies << Enemy_1.new(Window.width - 200, - 250)
          when 1350
            @enemies << Enemy_1.new(Window.width / 4, -200)
            @enemies << Enemy_2.new(Window.width / 2, -150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            @items << Repaire_Box.new(rand(200..900), -20)
          when 1800
            @items << Repaire_Box.new(rand(100..Window.width - 100), -20)
            @count = -1
            @fase = 2
          end
        when 2
          case @count
          when 0
            @enemies << Enemy_2.new(Window.width / 2, -100)
            @enemies << Enemy_2.new(Window.width / 2 - 200, - 130)
            @enemies << Enemy_2.new(Window.width / 2 + 200, -130)
          when 120
            @enemies << Enemy_2.new(Window.width / 2, -100)
          when 240
            @enemies << Enemy_2.new(Window.width / 2, - 100)
          when 360
            @enemies << Enemy_2.new(Window.width / 2, - 100)
          when 480
            @enemies << Enemy_2.new(Window.width / 2, - 100)
          when 600
            @enemies << Enemy_2.new(Window.width / 2, - 100)
          when 1000
            @count = -1
            @fase = 3
            @items << Repaire_Box.new(rand(100..Window.width - 100), -20)
          end
        when 3
          case @count
          when 0
            @enemies << Enemy_1.new(Window.width / 4, -200)
            @enemies << Enemy_2.new(Window.width / 2, -150)
            @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            @items << Repaire_Box.new(rand(200..900), -20)
          when 450
            @enemies << Enemy_2.new(Window.width / 2, - 100)
            @enemies << Enemy_1.new(Window.width / 2 + 100, - 150)
            @enemies << Enemy_1.new(Window.width / 2 - 100, - 150)
            @enemies << Enemy_1.new(Window.width / 2 + 200, - 200)
            @enemies << Enemy_1.new(Window.width / 2 - 200, - 200)
          when 600
            @enemies << Enemy_2.new(Window.width / 2, - 100)
            @enemies << Enemy_1.new(Window.width / 2 + 100, - 150)
            @enemies << Enemy_1.new(Window.width / 2 - 100, - 150)
            @enemies << Enemy_1.new(Window.width / 2 + 200, - 200)
            @enemies << Enemy_1.new(Window.width / 2 - 200, - 200)
          when 900
            @fase = 0
            @count = -1
            @items << Repaire_Box.new(rand(100..Window.width - 100), -20)
          end
        end
      end
    end
  end
end