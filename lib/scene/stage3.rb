module Scene
  class Stage3 < Scene::Stage
    include Fixture::Stage1
    def initialize
      super
      @player = Fixture::Player.new
      @carrier = Image.load("#{$PATH}/lib/images/Carrier.png")
      @destroy_enemy = 0
      @stage_num = 3
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
              @enemy_num -= 1
              $score += 10
            end
            n.hit = true
          end
        end
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
