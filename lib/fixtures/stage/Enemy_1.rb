module Fixture
  module Stage
    class Enemy_1 < Sprite
      attr_reader :health, :fire, :name
      def initialize(x, y)
        @name = "Enemy_1"
        self.x = x
        self.y = y
        @health = 5
        @normal = Image.load("#{$PATH}/lib/images/fighter_thunderbolt_normal.png")
        @shot = Image.load("#{$PATH}/lib/images/fighter_thunderbolt_fire.png")
        self.image = @normal
        @count = 0
        @shot_timer = 0
        @shot = false
        @shot_num = 0
      end
      def update
        @fire = false
        return 1 if @health <= 0
        if @shot_num > 3
          @shot = false
          @shot_num = 0
        end
        @shot_timer += 1
        @count += 1
        if @count % 200 == 0
          @shot = true
        end
        move
      end
      def damage
        @health -= 1
      end

      def move
        if @count < 300
          self.y += 1
          if @shot && @count % 10 == 0
            @shot_num += 1
            @fire = true
            @shot_timer = 0
          end
        elsif @count >= 300 && @count < 500
          self.x -= 2.5
          if @shot && @count % 15 == 0
            @shot_num += 1
            @fire = true
            @shot_timer = 0
          end
        elsif @count >= 500 && @count < 700
          self.x += 2.5
          if @shot && @count % 10 == 0
            @shot_num += 1
            @fire = true
            @shot_timer = 0
          end
        elsif @count >= 700 && @count < 900
          self.x += 2.5
          if @shot && @count % 10 == 0
            @shot_num += 1
            @fire = true
            @shot_timer = 0
          end
        elsif @count >= 900 && @count < 1100
          self.x -= 2.5
          if @shot && @count % 10 == 0
            @shot_num += 1
            @fire = true
            @shot_timer = 0
          end
        else
          @count = 300
        end
        self.draw
      end
    end
  end
end