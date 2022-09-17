module Scene
  class Base
    def initialize
      @count = 0
      @background = Image.load("#{$PATH}/lib/images/Sea.png")
      @mouse = Fixture::Mouse.new
      @is_finish = false
      @next_scene = nil
    end

    def update
      @count += 1
      @mouse.update
    end

    def next_scene
      raise NotImplementedError
    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @is_finish
    end

    private


  end
end