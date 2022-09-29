module Fixture
  module Stage4
    class Enemy_1_Gun_1 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end

      def move
        self.y += 7
      end
    end

    class Enemy_1_Gun_2 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end
      def move
        self.y += 5
        self.x += 3
      end
    end


    class Enemy_1_Gun_3 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end

      def move
        self.y += 5
        self.x -= 3
      end
    end
  end
end
