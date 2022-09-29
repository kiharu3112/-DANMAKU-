module Fixture
  module Stage6
    class Enemy_2
      attr_reader :health, :bullets
      def initialize(x, y)
        self.x = x
        self.y = y
        @health = 5
        @normal = Image.load("#{$PATH}/lib/images/fighter_thunderbolt_normal.png")
        @shot = Image.load("#{$PATH}/lib/images/fighter_thunderbolt_fire.png")
        self.image = @normal
        @count = 0
        @shot_timer = 0
        @bullets = []
        @shot = false
        @shot_num = 0
      end
      def update
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
        @bullets.each { |n| n.update }
        @bullets.delete_if { |n|n.hit }
        if @count < 300
          self.y += 1
          if @shot && @count % 10 == 0
            @shot_num += 1
            shot
            @shot_timer = 0
          end
        elsif @count >= 300 && @count < 500
          self.x -= 2
          if @shot && @count % 15 == 0
            @shot_num += 1
            shot
            @shot_timer = 0
          end
        elsif @count >= 500 && @count < 700
          self.x += 2
          if @shot && @count % 10 == 0
            @shot_num += 1
            shot
            @shot_timer = 0
          end
        else
          @count = 300
        end
        self.draw
      end
      def shot
        @bullets << Enemy_1_Gun_1.new(self.x + 3, self.y + 30)
        @bullets << Enemy_1_Gun_1.new(self.x + 40, self.y + 30)
        @bullets << Enemy_1_Gun_2.new(self.x + 3, self.y + 30)
        @bullets << Enemy_1_Gun_3.new(self.x + 40, self.y + 30)
      end
      def damage
        @health -= 1
      end
    end
  end
end