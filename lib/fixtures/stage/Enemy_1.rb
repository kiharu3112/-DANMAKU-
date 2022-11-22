module Fixture
  module Stage
    class Enemy_1 < Sprite
      attr_reader :health, :fire, :name
      def initialize(x, y)
        super
        @name = "Enemy_1"
        self.x = x
        self.y = y
        @health = 10
        @normal = Image.load("#{$path}/lib/images/stages/fighter_thunderbolt_normal.png")
        @shot = Image.load("#{$path}/lib/images/stages/fighter_thunderbolt_fire.png")
        @shot_sound = Sound.new("#{$path}/lib/sounds/shot1.wav")
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
        if @count < 150
          self.y += 1.5
          shot if @shot && @count % 10 == 0
        elsif @count >= 150 && @count < 350
          self.x -= 2.5
          shot if @shot && @count % 15 == 0
        elsif @count >= 350 && @count < 550
          self.x += 2.5
          shot if @shot && @count % 10 == 0
        elsif @count >= 550 && @count < 750
          self.x += 2.5
          shot if @shot && @count % 10 == 0
        elsif @count >= 750 && @count < 950
          self.x -= 2.5
          shot if @shot && @count % 10 == 0
        else
          @count = 150
        end
        self.draw
      end

      def shot
        @shot_num += 1
        @fire = true
        @shot_timer = 0
        @shot_sound.play.set_volume($volume)
      end
    end
  end
end