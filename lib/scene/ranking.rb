module Scene
  class Ranking < Scene::Base
    def initialize
      @is_finish = false
      @next_scene = nil
    end

    def update
      File.open("#{$PATH}/rank.json") do |file|
        @data = JSON.load(file)
      end
      Window.draw_font(100, 100, "Ranking!", Font.new(32, @font))
      if Input.key_push?(K_RETURN) || Input.mouse_push?(M_LBUTTON)
        @next_scene = Scene::Opening.new
        @is_finish = true
      end

      Window.draw_font(Window.width / 6, Window.height / 5, "1  #{@data["ranking"][0]["name"]}   score : #{@data["ranking"][0]["score"]}   time : #{@data["ranking"][0]["time"]}", Font.new(56, @font))
      4.times do |i|
        n = i + 1
        next if @data["ranking"][n]["name"] == ""
        Window.draw_font(Window.width / 5, Window.height / 5 + 50 * n + 100, "#{n + 1}   #{@data["ranking"][n]["name"]}    score : #{@data["ranking"][n]["score"]}    time : #{@data["ranking"][n]["time"]}", Font.new(40, @font))
      end
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