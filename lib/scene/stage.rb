module Scene
  class Stage < Scene::Base
    def initialize
      super
      @enemies = []
      @scene = :start
      @player = Fixture::Player.new
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
      @enemies.each do |n|
        n.bullets.each do |i|
          if i === @player
            @player.damage
            i.hit = true
          end
        end
      end

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
          @next_scene = Scene::Result.new(@stage_num)
        end
      else
        @is_finish = true
        @next_scene = Scene::Result.new(@stage_num)
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