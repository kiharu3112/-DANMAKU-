module Scene
  module Stages
    class Stage < Scene::Base
      include Fixture::Stage
      def initialize
        super
        @enemies = []
        @scene = :start
        @player = Fixture::Player.new
        @enemy_bullet = []
      end

      def update
        super
        start if @scene == :start
        game if @scene == :game
        end_scene if @scene == :end
      end

      def start
        @player.y = Window.height + 10 if @count == 1
        background_move_draw_1
        @player.y -= 1
        @player.image
        if @player.y <= Window.height - @player.normal_image.height
          @scene = :game
          @count = 0
        end
      end

      def game
        background_move_draw_2
        @player.update
        Window.draw_font(Window.width - 300, 100, "score : #{$score}", Font.new(36, @font))
        Window.draw_font(Window.width - 300, 150, "health :#{$health}", Font.new(36, @font))
        if (@enemies.count <= 0  && @count > 500) || $health <= 0
          @scene = :end
          @player.image = @player.normal_image
        end
        #########################################################################
        @enemies.each { |n| n.update }
        @enemies.delete_if { |n| n.health <= 0 }


        @enemy_bullet.each do |n|
          if n === @player
            @player.damage
            n.hit = true
          end
        end

        @enemies.each do|n|
          if n.name == "Enemy_1"
            if n.fire
              @enemy_bullet << Enemy_1_Gun_1.new(n.x + 3, n.y + 30)
              @enemy_bullet << Enemy_1_Gun_1.new(n.x + 40, n.y + 30)
              @enemy_bullet << Enemy_1_Gun_2.new(n.x + 3, n.y + 30)
              @enemy_bullet << Enemy_1_Gun_3.new(n.x + 40, n.y + 30)
            end
          elsif n.name == "Enemy_2"
            if n.fire1
              @enemy_bullet << Enemy_2_Gun_1.new(n.x + 3, n.y + 30)
              @enemy_bullet << Enemy_2_Gun_1.new(n.x + 40, n.y + 30)
              @enemy_bullet << Enemy_2_Gun_2.new(n.x + 3, n.y + 30)
              @enemy_bullet << Enemy_2_Gun_3.new(n.x + 40, n.y + 30)
            end
            if n.fire2
              @enemy_bullet << Enemy_2_Gun_6.new(n.x + 3, n.y + 30)
              @enemy_bullet << Enemy_2_Gun_7.new(n.x + 40, n.y + 30)
              @enemy_bullet << Enemy_2_Gun_4.new(n.x + 3, n.y + 30)
              @enemy_bullet << Enemy_2_Gun_5.new(n.x + 40, n.y + 30)
            end
          end
        end
        @enemy_bullet.each { |n| n.update}
        @enemy_bullet.delete_if {|n| n.hit }

        @player.bullets.each do |n|
          @enemies.each do |i|
            if i === n
              i.damage
              if i.health <= 0
                @enemy_num -= 1
                $score += 10
                break
              end
              n.hit = true
            end
          end
        end
      end

      def end_scene
        background_move_draw_2
        if $health >= 1
          @player.draw
          @enemies.each { |n| n.draw }
          @player.y -= 5
          if @player.y < -10
            @is_finish = true
          end
        else
          @is_finish = true
        end
      end

      def background_move_draw_1
        background_y_pos = @count % Window.height
        Window.draw(0, background_y_pos - Window.height, @background)
        Window.draw(0, background_y_pos, @background)
      end

      def background_move_draw_2
        background_y_pos = (@count * 2) % Window.height
        Window.draw(0, background_y_pos - Window.height, @background)
        Window.draw(0, background_y_pos, @background)
      end

      def just_draw
        Window.draw(0, 0, @background)
      end
    end

  end
end