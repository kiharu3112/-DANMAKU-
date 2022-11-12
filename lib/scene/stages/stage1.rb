# frozen_string_literal: true

module Scene
  module Stages
    class Stage1 < Scene::Stages::Stage
      def initialize
        super
        @carrier = Image.load("#{$PATH}/lib/images/stages/Carrier.png")
        @enemy_num = 9
        @next_scene = Scene::Results::Result1.new
      end

      def start
        if @count > 60
          background_move_draw_1
          Window.draw(Window.width / 2 - @carrier.width / 2,
                      (@count - 60) * 4 - (@carrier.height - 300) / 2, @carrier)
          @player.y -= 5 if @count > 360
          @player.image
          if @count > 600
            @player.y = Window.height + 50
            @player.y -= (@count - 600)
            if @player.y == Window.height - 60
              @scene = :game
              @count = 0
            end
          end
        else
          just_draw
          Window.draw(Window.width / 2 - @carrier.width / 2, -1 * (@carrier.height - 300) / 2, @carrier)
          @player.image
        end
      end

      def game
        super
        case @count
        when 0
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 450
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        when 900
          @enemies << Enemy_1.new(Window.width / 4, -200)
          @enemies << Enemy_1.new(Window.width / 2, -150)
          @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
        end
      end
    end
  end
end
