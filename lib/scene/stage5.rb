module Scene
  class Stage5 < Scene::Stage
    include Fixture::Stage1
    def initialize
      super
      @stage_num = 5
      @enemy_num = 9
    end

    def update
      super
    end

    def start
      super
    end

    def game
      super
      case @count
      when 0
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 500
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 1000
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      end
    end

    def end_scene
      super
    end

    def finish?
      super
    end

    def next_scene
      super
    end
  end
end

