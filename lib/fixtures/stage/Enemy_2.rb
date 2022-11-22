module Fixture
  module Stage
    class Enemy_2 < Sprite
      attr_reader :health, :name, :fire1, :fire2
      def initialize(x, y)
        @name = "Enemy_2"
        self.x = x
        self.y = y
        @health = 15
        @normal = Image.load("#{$path}/lib/images/stages/fighter_stuka_normal.png")
        @shot = Image.load("#{$path}/lib/images/stages/fighter_stuka_fire.png")
        @shot_sound = Sound.new("#{$path}/lib/sounds/shot2.wav")
        self.image = @normal
        @count = 0
        @shot_num = 1
      end

      def update
        @count += 1
        return 1 if @health.negative?
        @fire1 = false
        @fire2 = false
        move
      end

      def damage
        @health -= 1
      end

      def move
        if @count < 150
          self.y += 2
          @fire2 = @count == 75
        elsif @count >= 150 && @count < 200
          self.x -= 1
        elsif @count >= 200 && @count < 250
          if @shot_num == 1 && @count % 15 == 0
            fire
          elsif @shot_num == 2 && @count % 15 == 0
            fire
          end
        elsif @count >= 250 && @count < 300
          self.x += 1
        elsif @count >= 300 && @count < 350
          if @shot_num == 1 && @count % 15 == 0
            fire
          elsif @shot_num == 2 && @count % 15 == 0
            shot
          end
        else
          @count = 150
        end
        self.draw
      end

      def fire
        @fire2 = true
        @shot_num = 1
        @shot_sound.play
      end
    end
  end
end