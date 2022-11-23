module Scene
  class Ranking < Scene::Base
    include Fixture
    def initialize
      super
      @Font = 'x8y12pxTheStrongGamer'
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
      show_cat(@count) if @count < 80
      show_rank if @count > 100

      if @count == 100
        File.open("user.json") do |file|
          @data = JSON.load(file)
        end
      end

      input_key = input
      if input_key
        @is_finish = true
      end
    end

    def show_cat(count)
      case
      when count < 15
        Window.draw_font(100, Window.height / 3 , "Loading Data", Font.new(46, @Font))
      when count < 30
        Window.draw_font(100, Window.height / 3 , "Loading Data .", Font.new(46, @Font))
      when count < 45
        Window.draw_font(100, Window.height / 3 , "Loading Data ..", Font.new(46, @Font))
      when count < 60
        Window.draw_font(100, Window.height / 3 , "Loading Data ...", Font.new(46, @Font))
      when count < 75
        Window.draw_font(100, Window.height / 3 , "Loading Data ." , Font.new(46, @Font))
      when count < 90
        Window.draw_font(100, Window.height / 3 , "Loading Data ..", Font.new(46, @Font))
      when count < 100
        Window.draw_font(100, Window.height / 3 , "Loading Data ...", Font.new(46, @Font))
      end
      bar = Array.new(80, " ")
      count.times{ |n|  bar[n] = "#" }
      Window.draw_font(20, Window.height / 2 - 10, "[#{bar.join}]", Font.new(18, @Font))
    end

    def show_rank

      if $lang == "en"
        Window.draw_font(Window.width / 2 - 150, 80, "Ranking!", Font.new(64, @Font))
        if @data["ranking"].count > 0
          Window.draw_font(Window.width / 10, Window.height / 5 + 20, "👑1  #{@data["ranking"][0]["name"]}   score:#{@data["ranking"][0]["score"]}\n     date:#{@data["ranking"][0]["time"]}", Font.new(48, @Font))
          4.times do |i|
            n = i + 1
            break if @data["ranking"][n] == nil
            Window.draw_font(Window.width / 8, Window.height / 5 + 130 * n + 100, "#{n + 1}   #{@data["ranking"][n]["name"]}  score:#{@data["ranking"][n]["score"]}\n       date:#{@data["ranking"][n]["time"]}", Font.new(40, @Font))
          end
        else
          Window.draw_font(Window.width / 2 - 100, Window.height / 2 - 100,"No DATA", Font.new(48, @Font))
        end
      else
        Window.draw_font(Window.width / 2 - 100, 80, "ランキング!", Font.new(64, @Font))
        if @data["ranking"].count > 0
          Window.draw_font(Window.width / 10, Window.height / 5 + 20, "👑1  #{@data["ranking"][0]["name"]}   スコア:#{@data["ranking"][0]["score"]}\n     日時:#{@data["ranking"][0]["time"]}", Font.new(48, @Font))
          4.times do |i|
            n = i + 1
            break if @data["ranking"][n] == nil
            Window.draw_font(Window.width / 8, Window.height / 5 + 130 * n + 100, "#{n + 1}   #{@data["ranking"][n]["name"]}  スコア:#{@data["ranking"][n]["score"]}\n       日時:#{@data["ranking"][n]["time"]}", Font.new(40, @Font))
          end
        else
          Window.draw_font(Window.width / 2 - 65, Window.height / 2 - 100,"データなし", Font.new(48, @Font))
        end
      end
    end
  end
end