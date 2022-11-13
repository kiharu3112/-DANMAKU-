module Scene
  class NameInput < Scene::Base
    include Fixture
    def initialize
      super
      @name = []
      @vertical_line = Image.new(5, 80, C_WHITE)
      @beside_line = Image.new(750, 5, C_WHITE)
      File.open("user.json") do |file|
        @data = JSON.load(file)
      end
      @time = Time.now
      @next_scene = Scene::Ranking.new
    end

    def update
      super
      if $lang == "en"
        Window.draw_font(Window.width / 2 - 500, Window.height / 5, "Please Input Your Name", Font.new(64, @Font))
        Window.draw_font(Window.width / 2 - 230, Window.height / 3, "SCORE IS : #{$score}", Font.new(64, @Font))
      else
        Window.draw_font(Window.width / 2 - 500, Window.height / 5, "ナマエヲニュウリョクシテクダサイ", Font.new(64, @Font))
        Window.draw_font(Window.width / 2 - 230, Window.height / 3, "アナタノスコアハ : #{$score}テン", Font.new(64, @Font))
      end
      Window.draw(Window.width / 3 - 100, Window.height / 2, @vertical_line)
      Window.draw(Window.width / 3 - 100, Window.height / 2, @beside_line)
      Window.draw(Window.width / 3 - 100, Window.height / 2 + 75, @beside_line)
      Window.draw(Window.width / 3 + 650,Window.height / 2, @vertical_line)

      Window.draw_font(Window.width / 3 - 90, Window.height / 2 + 10, "#{@name.join}", Font.new(64, @Font))
      n = input
      case n
      when "back"
        @name.pop
      when "enter"
        if @name.count > 0
          @is_finish = true
          add_data
        end
      else
        if @name.count <= 16 && n != nil
          @name << n
        end
      end
    end

    def add_data
      @userdata = {
        "name":@name.join,
        "score":$score,
        "time":"#{@time.year}/#{@time.month}/#{@time.day} #{@time.hour}:#{@time.min == 0 ? '00' : @time.min}"
      }
      5.times do |n|
        if @data["ranking"][n] == nil
          @data["ranking"].insert(n,@userdata)
          break
        end
        if @data["ranking"][n]["score"] < $score || @data["ranking"][n]["name"] == ""
          @data["ranking"].insert(n,@userdata)
          break
        end
      end
      File.open("user.json", "w") do |file|
        @data = JSON.pretty_generate(@data)
        file.puts(@data)
        file.close
      end
    end
  end
end