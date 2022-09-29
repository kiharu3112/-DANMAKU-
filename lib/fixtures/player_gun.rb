module Fixture
      class Player_Gun1 < Fixture::Stage::Bullet
          def initialize(x, y)
              super(x, y, Image.new(4, 9, C_YELLOW))
          end

          def update
              super
          end

          def move
              self.y -= 15
          end
      end

      class Player_Gun2 < Fixture::Stage::Bullet
          def initialize(x, y)
              super(x, y, Image.new(4, 9, C_YELLOW))
          end

          def update
              super
          end
          def move
              self.y -= 12
              self.x -= 3
          end
      end
      class Player_Gun3 < Fixture::Stage::Bullet
          def initialize(x, y)
              super(x, y, Image.new(4, 9, C_YELLOW))
          end

          def update
              super
          end
          def move
              self.y -= 12
              self.x += 3
          end
      end
end