module Fixture
  module Stage4
    class Bullet < Sprite
      attr_accessor :hit
      def initialize(x, y, image)
        super(x, y, image)
        @hit = false
      end
      def update
        move
        if self.x < 0 || self.x > Window.width || self.y > Window.height || self.y < 0 || @hit
          @hit = true
          return 1
        end
        self.draw
      end

      def move

      end
    end
  end

end