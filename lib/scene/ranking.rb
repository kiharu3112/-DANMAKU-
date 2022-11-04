module Scene
  class Ranking < Scene::Base
    def initialize
      super
      @font = 'x8y12pxTheStrongGamer'
      File.open("rank.json") do |file|
        @data = JSON.load(file)
      end
      @keys = [
        K_A,
        K_B,
        K_C,
        K_D,
        K_E,
        K_F,
        K_G,
        K_H,
        K_I,
        K_J,
        K_K,
        K_L,
        K_N,
        K_M,
        K_O,
        K_P,
        K_Q,
        K_R,
        K_S,
        K_T,
        K_U,
        K_V,
        K_W,
        K_X,
        K_Y,
        K_Z,
        K_RETURN,
        K_SPACE
      ]
      @next_scene = Scene::Opening.new
    end

    def update
      super
      @keys.each { |i| @is_finish = true if Input.key_down?(i) }
      Window.draw_font(Window.width / 2 - 150, 80, "Ranking!", Font.new(64, @font))
      if @data["ranking"].count > 0
        Window.draw_font(Window.width / 10, Window.height / 5 + 20, "👑1  #{@data["ranking"][0]["name"]}   score:#{@data["ranking"][0]["score"]}\n     date:#{@data["ranking"][0]["time"]}", Font.new(48, @font))
        ( @data["ranking"].count - 1 ).times do |i|
          n = i + 1
          next if @data["ranking"][n]["name"] == ""
          Window.draw_font(Window.width / 8, Window.height / 5 + 130 * n + 100, "#{n + 1}   #{@data["ranking"][n]["name"]}  score:#{@data["ranking"][n]["score"]}\n       date:#{@data["ranking"][n]["time"]}", Font.new(40, @font))
        end
      else
        Window.draw_font(Window.width / 2 - 100, Window.height / 2 - 100,"No DATA", Font.new(48, @font))
      end
    end
  end
end