module Scene
  class NameInput < Scene::Base
    include Fixture # if rank is true, add ranking else add clears
    attr_accessor :rank
    def initialize
      super
      @rank = false
      @name = []
      @vertical_line = Image.new(5, 80, C_WHITE)
      @beside_line = Image.new(750, 5, C_WHITE)
      @click_sound = Sound.new("#{$path}/lib/sounds/title_button_click.wav")
    end

    def update
      super
      if $lang == "en"
        Window.draw_font(Window.width / 2 - 450, Window.height / 5, "Please Input Your Name", Font.new(64, @Font))
        Window.draw_font(Window.width / 2 - 230, Window.height / 3, "SCORE IS : #{$score}", Font.new(64, @Font))
      else
        Window.draw_font(Window.width / 2 - 350, Window.height / 5, "ナマエヲニュウリョクシテクダサイ", Font.new(66, @Font))
        Window.draw_font(Window.width / 2 - 230, Window.height / 3, "アナタノスコアハ : #{$score}テン", Font.new(64, @Font))
      end
      Window.draw(150, Window.height / 2, @vertical_line)
      Window.draw(150, Window.height / 2, @beside_line)
      Window.draw(150, Window.height / 2 + 75, @beside_line)
      Window.draw(150 + 750,Window.height / 2, @vertical_line)

      Window.draw_font(160, Window.height / 2 + 10, "#{@name.join}", Font.new(64, @Font))
      n = input
      case n
      when "back"
        @name.pop
      when "enter"
        if @name.count > 0
          @is_finish = true
          @next_scene = Scene::Ranking.new
          add_data
          $bgm.stop
          $bgm.dispose
          $bgm = Sound.new("#{$path}/lib/sounds/bgm_1.mid")
          $bgm.play
        end
      else
        if @name.count <= 16 && n != nil
          @name << n
        end
      end
    end

    def add_data
      @click_sound.play
      File.open("user.json") do |file|
        @data = JSON.load(file)
      end
      @time = Time.now

      if @rank
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
      else
        @userdata = {
          "name":@name.join,
          "time":"#{@time.year}/#{@time.month}/#{@time.day} #{@time.hour}:#{@time.min == 0 ? '00' : @time.min}"
        }
        @data["clears"] << @userdata
      end

      File.open("user.json", "w") do |file|
        @data = JSON.pretty_generate(@data)
        file.puts(@data)
        file.close
      end
    end
  end
end
