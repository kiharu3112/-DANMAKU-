module Scene
  class Ranking < Scene::Base
    include Fixture
    def initialize
      super
      @font = 'x8y12pxTheStrongGamer'
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
      Window.draw_font(Window.width / 2 - 150, 80, "Ranking!", Font.new(64, @font))

      show_cat(@count) if @count < 100
      show_rank if @count > 100

      if @count == 100
        File.open("user.json") do |file|
          @data = JSON.load(file)
        end
      end
    end

    def show_cat(count)
      case
      when count < 15
        Window.draw_font(100, Window.height / 3 , "Loading Data", Font.new(46, @font))
      when count < 30
        Window.draw_font(100, Window.height / 3 , "Loading Data .", Font.new(46, @font))
      when count < 45
        Window.draw_font(100, Window.height / 3 , "Loading Data ..", Font.new(46, @font))
      when count < 60
        Window.draw_font(100, Window.height / 3 , "Loading Data ...", Font.new(46, @font))
      when count < 75
        Window.draw_font(100, Window.height / 3 , "Loading Data ." , Font.new(46, @font))
      when count < 90
        Window.draw_font(100, Window.height / 3 , "Loading Data ..", Font.new(46, @font))
      when count < 100
        Window.draw_font(100, Window.height / 3 , "Loading Data ...", Font.new(46, @font))
      end
      bar = Array.new(100, " ")
      count.times{ |n|  bar[n] = "#" }
      Window.draw_font(20, Window.height / 2 - 10, "[#{bar.join}]", Font.new(18, @font))
    end

    def show_rank
      input_key = input
      @is_finish = true if input_key
      begin
        if @data["ranking"].count > 0
          Window.draw_font(Window.width / 10, Window.height / 5 + 20, "👑1  #{@data["ranking"][0]["name"]}   score:#{@data["ranking"][0]["score"]}\n     date:#{@data["ranking"][0]["time"]}", Font.new(48, @font))
          4.times do |i|
            n = i + 1
            break if @data["ranking"][n] == nil
            Window.draw_font(Window.width / 8, Window.height / 5 + 130 * n + 100, "#{n + 1}   #{@data["ranking"][n]["name"]}  score:#{@data["ranking"][n]["score"]}\n       date:#{@data["ranking"][n]["time"]}", Font.new(40, @font))
          end
        else
          Window.draw_font(Window.width / 2 - 100, Window.height / 2 - 100,"No DATA", Font.new(48, @font))
        end
      rescue => e
        puts e
      end
    end
  end
end