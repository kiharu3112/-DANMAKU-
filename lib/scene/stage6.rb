module Scene
  class Stage6 < Scene::Stage
    include Fixture::Stage
    def initialize
      super
      @stage_num = 6
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
      when 150
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 220
        @enemies << Enemy_2.new(@player.x - 100, -200)
        @enemies << Enemy_2.new(@player.x + 100, -150)
      when 450
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_2.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 650
        @enemies << Enemy_1.new(@player.x - 200, -200)
        @enemies << Enemy_1.new(@player.x + 200, -200)
      when 900
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 1200
        @enemies << Enemy_2.new(Window.width / 4, -200)
        @enemies << Enemy_2.new(Window.width / 2, -150)
        @enemies << Enemy_2.new(Window.width / 4 * 3, -200)
      when 1400
        @count = 0
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

