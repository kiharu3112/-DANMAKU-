module Scene
  class Stage3 < Scene::Stage
    def initialize
      super
      @next_scene = Scene::Results::Result3.new
      @enemy_num = 18
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
      when 100
        @enemies << Enemy_1.new(@player.x - 140, -200)
        @enemies << Enemy_1.new(@player.x, -150)
        @enemies << Enemy_1.new(@player.x + 140, -200)
      when 500
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 600
        @enemies << Enemy_1.new(@player.x - 140, -200)
        @enemies << Enemy_1.new(@player.x, -150)
        @enemies << Enemy_1.new(@player.x + 140, -200)
      when 1100
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 1200
        @enemies << Enemy_1.new(@player.x - 140, -200)
        @enemies << Enemy_1.new(@player.x, -150)
        @enemies << Enemy_1.new(@player.x + 140, -200)
      when 1600
        @enemies << Enemy_1.new(@player.x - 140, -200)
        @enemies << Enemy_1.new(@player.x, -150)
        @enemies << Enemy_1.new(@player.x + 140, -200)
      when 1700
        @enemies << Enemy_1.new(Window.width / 4, -200)
        @enemies << Enemy_1.new(Window.width / 2, -150)
        @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
      when 1900
        @enemies << Enemy_1.new(@player.x - 140, -200)
        @enemies << Enemy_1.new(@player.x, -150)
        @enemies << Enemy_1.new(@player.x + 140, -200)
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
