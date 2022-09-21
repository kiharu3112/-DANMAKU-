module Scene
  class End
    include Fixture
    def initialize
      @name = []
      @next_scene = Scene::Ranking.new
      @input
      @score = 300
      @next_scene = Scene::Ranking.new
      @finish = false
      @vertical_line = Image.new(5, 80, C_WHITE)
      @beside_line = Image.new(750, 5, C_WHITE)
    end

    def update
      Window.draw_font(Window.width / 2, Window.height / 4, "YOUR SCORE IS : #{@score}", Font.new(64))
      Window.draw(Window.width / 3 - 100, Window.height / 2, @vertical_line)
      Window.draw(Window.width / 3 - 100, Window.height / 2, @beside_line)
      Window.draw(Window.width / 3 - 100, Window.height / 2 + 75, @beside_line)
      Window.draw(Window.width / 3 + 650,Window.height / 2, @vertical_line)

      Window.draw_font(Window.width / 3 - 90, Window.height / 2 + 10, "#{@name.join}", Font.new(60))
      n = input
      case n
      when "back"
        @name.pop
      when "enter"
        @finish = true if @name.count > 0
      else
        if @name.count <= 13 && n != nil
          @name << n
        end
      end

      if Input.key_down?(K_ESCAPE)
        @finish = true
        @next_scene = nil
      end
    end

    def finish?
      @finish
    end

    def next_scene
      @next_scene
    end
  end
end
