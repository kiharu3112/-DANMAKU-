module Scene
  class Ranking < Scene::Base
    def initialize
      @is_finish = false
      @next_scene = nil
      @num = ["first", "second", "third", "forth", "fifth"]
      File.open("#{$PATH}/rank.json") do |file|
        @data = JSON.load(file)
      end
    end

    def update
      Window.draw_font(100, 100, "Ranking!", Font.new(32, @base_font))
      if Input.key_push?(K_RETURN) || Input.mouse_push?(M_LBUTTON)
        @next_scene = Scene::Opening.new
        @is_finish = true
      end
      5.times do |n|
        next if @data[@num[n]]["name"] == ""
        Window.draw_font(Window.width / 3, Window.height / 5 + 50 * n, "#{@data[@num[n]]["name"]} score : #{@data[@num[n]]["score"]} time : #{@data[@num[n]]["time"]}", Font.new(36, @font))
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