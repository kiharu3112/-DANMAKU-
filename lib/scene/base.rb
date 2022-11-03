module Scene
  class Base
    attr_reader :is_finish, :next_scene
    def initialize
      @count = 0
      @background = Image.load("#{$PATH}/lib/images/Sea.png")
      @mouse = Fixture::Mouse.new
      @is_finish = false
      @next_scene = nil
      @font = 'x8y12pxTheStrongGamer'
    end

    def update
      @next_scene = true if Input.key_down?(K_ESCAPE)
      @count += 1
      @mouse.update
    end
  end
end