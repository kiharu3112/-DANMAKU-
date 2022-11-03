module Scene
  class NameInput < Scene::Base
    include Fixture
    def initialize
      super
      @name = []
      @next_scene = nil
      @finish = false
      @vertical_line = Image.new(5, 80, C_WHITE)
      @beside_line = Image.new(750, 5, C_WHITE)
      File.open("rank.json") do |file|
        @data = JSON.load(file)
      end
      @t = Time.now
    end

    def update
      super
      Window.draw_font(Window.width / 2 - 500, Window.height / 5, "Please Input Your Name", Font.new(64, @font))
      Window.draw_font(Window.width / 2 - 230, Window.height / 3, "SCORE IS : #{$score}", Font.new(64, @font))
      Window.draw(Window.width / 3 - 100, Window.height / 2, @vertical_line)
      Window.draw(Window.width / 3 - 100, Window.height / 2, @beside_line)
      Window.draw(Window.width / 3 - 100, Window.height / 2 + 75, @beside_line)
      Window.draw(Window.width / 3 + 650,Window.height / 2, @vertical_line)

      Window.draw_font(Window.width / 3 - 90, Window.height / 2 + 10, "#{@name.join}", Font.new(64, @font))
      n = input
      case n
      when "back"
        @name.pop
      when "enter"
        if @name.count > 0
          @is_finish = true
          @next_scene = Scene::Ranking.new
          add_data
        end
      else
        if @name.count <= 16 && n != nil
          @name << n
        end
      end

      if Input.key_down?(K_ESCAPE)
        @finish = true
        @next_scene = nil
      end
    end

    def finish?
      return true if Input.key_down?(K_ESCAPE)
      @is_finish
    end

    def next_scene
      @next_scene
    end

    def add_data
      @userdata = {
        "name":@name.join,
        "score":$score,
        "time":"#{@t.year}/#{@t.month}/#{@t.day} #{@t.hour}:#{@t.min == 0 ? '00' : @t.min}"
      }
      5.times do |n|
        if @data["ranking"][n]["score"] < $score || @data["ranking"][n]["name"] == ""
          @data["ranking"].insert(n,@userdata)
          break
        end
      end
      File.open("rank.json", "w") do |file|
        JSON.dump(@data, file)
        p @data
      end
    end
  end
end