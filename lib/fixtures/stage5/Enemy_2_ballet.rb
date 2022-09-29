module Fixture
  module Stage5
    class Enemy_2_Gun_1 < Fixture::Stage4::Bullet
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

    class Enemy_2_Gun_2 < Fixture::Stage4::Bullet
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


    class Enemy_2_Gun_3 < Fixture::Stage4::Bullet
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

    class Enemy_2_Gun_4 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end
      def move
        self.y += 4
        self.x += 4
      end
    end


    class Enemy_2_Gun_5 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end

      def move
        self.y += 4
        self.x -= 4
      end
    end
    class Enemy_2_Gun_6 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end
      def move
        self.y += 6
        self.x += 1
      end
    end


    class Enemy_2_Gun_7 < Fixture::Stage4::Bullet
      attr_accessor :hit
      def initialize(x, y)
        super(x, y, Image.new(4, 9, C_YELLOW))
      end

      def update
        super
      end

      def move
        self.y += 6
        self.x -= 1
      end
    end


  end
end
