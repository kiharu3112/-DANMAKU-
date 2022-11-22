module Fixture
  module Stage
    class Bullet_3 < Fixture::Stage::Bullet
      attr_accessor :hit

      def initialize(x, y, radius)
        super(x, y, Image.new(5, 5, C_YELLOW))
        @radius = radius
      end

      def update
        super
      end

      def move
        self.x += 5 * cos(@radius)
        self.y += 5 * sin(@radius)
      end
    end
  end
end