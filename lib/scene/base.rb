module Scene
  class Base
    attr_reader :is_finish, :next_scene
    def initialize
      @count = 0
      @background = Image.load("#{$PATH}/lib/images/Sea.png")
      @is_finish = false
      @next_scene = nil
      @font = 'x8y12pxTheStrongGamer'
    end

    def update
      Window.close if Input.key_down?(K_ESCAPE)
      @count += 1
    end
  end
end