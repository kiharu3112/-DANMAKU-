module Fixture
    class Mouse < Sprite
        def initialize
            self.image = Image.new(1, 1, [0,0,0,0])
        end
        def update
            self.x = Input.mouse_pos_x
            self.y = Input.mouse_pos_y
            self.draw
        end
    end
end