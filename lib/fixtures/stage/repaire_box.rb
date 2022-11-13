module Fixture
  module Stage
    class Repaire_Box < Sprite
      attr_accessor :hit, :name
      def initialize(x, y, image)
        super
        self.x = x
        self.y = y
        self.image = Image.load("#{PATH}/lib/images/stages/box.png")
        @hit = false
        @neme = "repairebox"
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
    end
  end
end
