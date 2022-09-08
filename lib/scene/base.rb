module Scene
  class Base
    def initialize
      @count = 0
    end

    def update
      @count += 1
    end

    def next_scene
      raise NotImplementedError
    end

    def finish?
      raise NotImplementedError
    end

    private
  end
end