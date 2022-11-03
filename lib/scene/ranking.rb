module Scene
  class Ranking < Scene::Base
    def initialize
      @is_finish = false
      @next_scene = nil
      @font = 'x8y12pxTheStrongGamer'
    end

    def update
      File.open("rank.json") do |file|
        @data = JSON.load(file)
      end
      Window.draw_font(Window.width / 2 - 200, 80, "Ranking!", Font.new(64, @font))
      if Input.key_push?(K_RETURN) || Input.mouse_push?(M_LBUTTON)
        @next_scene = Scene::Opening.new
        @is_finish = true
      end

      Window.draw_font(Window.width / 10, Window.height / 5 + 20, "👑1  #{@data["ranking"][0]["name"]}   score:#{@data["ranking"][0]["score"]}\n     date:#{@data["ranking"][0]["time"]}", Font.new(48, @font))
      4.times do |i|
        n = i + 1
        next if @data["ranking"][n]["name"] == ""
        Window.draw_font(Window.width / 8, Window.height / 5 + 130 * n + 100, "#{n + 1}   #{@data["ranking"][n]["name"]}  score:#{@data["ranking"][n]["score"]}\n       date:#{@data["ranking"][n]["time"]}", Font.new(40, @font))
      end
    end

    def finish?
      super
    end

    def next_scene
      @next_scene
    end
  end
end