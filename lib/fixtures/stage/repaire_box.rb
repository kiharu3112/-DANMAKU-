module Fixture
  module Stage
    class Repaire_Box < Sprite
      attr_accessor :hit
      def initialize(x, y)
        super
        self.x = x
        self.y = y
        self.image = Image.load("#{$path}/lib/images/stages/box.png")
        @hit = false
      end
      def update
        if @hit || self.y > Window.height + 10
          @hit = true
          return 1
        end
        move
        self.draw
      end

      def move
        self.y += 5
      end

      def name
        "repair"
      end
    end
  end
end
