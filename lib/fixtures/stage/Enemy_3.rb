module Fixture
  module Stage
    class Enemy_3 < Sprite
      attr_reader :health, :name, :fire1, :fire2, :fire3
      def initialize(x, y)
        @name = "Enemy_3"
        self.x = x
        self.y = y
        @health = 150
        @normal = Image.load("#{$path}/lib/images/stages/fighter_lightning_normal.png")
        @shot = Image.load("#{$path}/lib/images/stages/fighter_lightning_fire.png")
        @shot_sound = Sound.new("#{$path}/lib/sounds/shot3.wav")
        self.image = @normal

        @move_count = 0
        @move_num = 0

        @shot_num = 0
        @shot_count = 0
      end

      def update
        return 1 if @health.negative?
        @fire1, @fire2, @fire3 = false
        move
        shot
        self.draw
      end

      def damage
        @health -= 1
      end

      def move
        case @move_num
        when 0
          @move_count += 1
          if @move_count > 100
            @move_num = 1
            @move_count = 0
          end
          self.y += 1
        when 1
          @move_count += 1
          if @move_count > 100
            @move_num = 2
            @move_count = 0
          end
          self.x += 1
        when 2
          @move_count += 1
          if @move_count > 50
            @move_num = 3
            @move_count = 0
          end
        when 3
          @move_count += 1
          if @move_count > 100
            @move_num = 4
            @move_count = 0
          end
          self.x -= 1
        when 4
          @move_count += 1
          if @move_count > 50
            @move_num = 5
            @move_count = 0
          end
        when 5
          @move_count += 1
          if @move_count > 50
            @move_num = 6
            @move_count = 0
          end
          self.x -= 1
        when 6
          @move_count += 1
          if @move_count > 50
            @move_num = 7
            @move_count = 0
          end
        when 7
          @move_count += 1
          if @move_count > 50
            @move_num = 8
            @move_count = 0
          end
          self.x += 1
        when 8
          @move_count += 1
          if @move_count > 50
            @move_num = 1
            @move_count = 0
          end
        end
      end

      def shot
        case @shot_num
        when 0
          @shot_count = 0
          @shot_num = rand(1..4)
        when 1
          @shot_num = 0 if @shot_count > 90
          if @shot_count % 6 == 0
            @fire2 = true
            @shot_sound.play.set_volume($volume)
          end
        when 2
          @shot_num = 0 if @shot_count > 60
          if @shot_count % 10 == 0 && @shot_count < 45
            @fire1 = true
            @shot_sound.play.set_volume($volume)
          end
        when 3
          @shot_num = 0 if @shot_count > 30
          if @shot_count % 6 == 0 && @shot_count < 25
            @fire2 = true
            @shot_sound.play.set_volume($volume)
          elsif @shot_count % 5 == 0
            @shot_sound.play.set_volume($volume)
            @fire1 = true
          end
        when 4
          @shot_num = 0 if @shot_count > 16
          if @shot_count % 6 == 0 && @shot_count < 15
            @fire3 = true
            @shot_sound.play.set_volume($volume)
          end
        end
        @shot_count += 1
      end
    end
  end
end
