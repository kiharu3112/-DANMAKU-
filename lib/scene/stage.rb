module Scene
  class Stage < Scene::Base
    def initialize
      super
      @next_scene = nil
      @is_finish = false
      @enemies = []
      @scene = :start
      @mosue = Fixture::Mouse.new
    end

    def update
      super
      @mouse.update
      start if @scene == :start
      game if @scene == :game
      end_scene if @scene == :end
    end

    def start

    end

    def game

    end

    def end_scene

    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @is_finish
    end

    def next_scene
      @next_scene
    end
  end
end