module Scene
  class Stage6 < Scene::Stage
    include Fixture::Stage1
    def initialize
      @player = Fixture::Player.new
      @carrier = Image.load("#{$PATH}/lib/images/Carrier.png")
      @destroy_enemy = 0
      super
    end

    def update
      super
    end

    def start
      super
    end

    def game
      background_move_draw_2
      @player.update
      case @count
      when 0
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 500
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 1000
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      end
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
              @destroy_enemy += 1
              $score += 10
            end

            n.hit = true
          end
        end
      end

      ###############################################
      # check
      if (@enemies.count == 0 && @count > 1300) || $health <= 0
        @scene = :end
        @player.image = @player.normal_image
      end
      super
    end

    def end_scene
      super
      background_move_draw_2
      if $health >= 1
        @player.draw
        @enemies.each { |n| n.draw }
        @player.y -= 5
        if @player.y < -10
          @is_finish = true
          @next_scene = Scene::Result.new(6)
        end
      else
        @is_finish = true
        @next_scene = Scene::Result.new(6)
      end
    end

    def finish?
      super
    end

    def next_scene
      super
    end
  end
end

