module Fixture
  module Stage
    class Enemy_2 < Sprite
      attr_reader :health, :bullets
      def initialize(x, y)
        self.x = x
        self.y = y
        @health = 15
        @normal = Image.load("#{$PATH}/lib/images/fighter_stuka_normal.png")
        @shot = Image.load("#{$PATH}/lib/images/fighter_stuka_fire.png")
        self.image = @normal
        @count = 0
        @shot_num = 1
        @bullets = []
      end
      def update
        @count += 1
        return 1 if @health <= 0
        @bullets.each { |n| n.update }
        @bullets.delete_if { |n|n.hit }
        #move & shot
        ############################################
        if @count < 150
          self.y += 2
          shot2 if @count == 75
        elsif @count >= 150 && @count < 200
          self.x -= 1
        elsif @count >= 200 && @count < 250
          if @shot_num == 1 && @count % 15 == 0
            shot
            @shot_num = 2
          elsif @shot_num == 2 && @count % 15 == 0
            shot2
            @shot_num = 1
          end
        elsif @count >= 250 && @count < 300
          self.x += 1
        elsif @count >= 300 && @count < 350
          if @shot_num == 1 && @count % 15 == 0
            shot
            @shot_num = 2
          elsif @shot_num == 2 && @count % 15 == 0
            shot2
            @shot_num = 1
          end
        else
          @count = 150
        end
        self.draw
        ##############################################
      end
      def shot
        @bullets << Enemy_2_Gun_1.new(self.x + 3, self.y + 30)
        @bullets << Enemy_2_Gun_1.new(self.x + 40, self.y + 30)
        @bullets << Enemy_2_Gun_2.new(self.x + 3, self.y + 30)
        @bullets << Enemy_2_Gun_3.new(self.x + 40, self.y + 30)
      end

      def shot2
        @bullets << Enemy_2_Gun_6.new(self.x + 3, self.y + 30)
        @bullets << Enemy_2_Gun_7.new(self.x + 40, self.y + 30)
        @bullets << Enemy_2_Gun_4.new(self.x + 3, self.y + 30)
        @bullets << Enemy_2_Gun_5.new(self.x + 40, self.y + 30)
      end
      def damage
        @health -= 1
      end
    end
  end
end