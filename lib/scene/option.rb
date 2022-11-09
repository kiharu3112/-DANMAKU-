module Scene
  class Option < Scene::Base
    def initialize
      super
      @next_scene = Scene::Opening.new
      @arrow = Image.load("#{$PATH}/lib/images/option/arrow.png")
      @lang = 0 if $lang == 'en'
      @lang = 1 if $lang == 'ja'
      @volume = $volume
      @select = 0 # 0:lang 1:volume 2:apply 3:delete ranking 4:reset
      @en_normal = Image.load("#{$PATH}/lib/images/option/en_save_normal.png")
      @en_select = Image.load("#{$PATH}/lib/images/option/en_save_select.png")
      @ja_normal = Image.load("#{$PATH}/lib/images/option/ja_save_normal.png")
      @ja_select = Image.load("#{$PATH}/lib/images/option/ja_save_select.png")
    end

    def update
      super
      if @select.zero?
        [0, 1, 20, 21].each do |n|
          next unless Input.pad_push?(n)

          @lang = case @lang
                  when 1
                    0
                  when 0
                    1
                  else
                    0
                  end
        end
      elsif @select == 1
        if Input.pad_push?(0) || Input.pad_push?(20)
          @volume -= 1
        elsif Input.pad_push?(1) || Input.pad_push?(21)
          @volume += 1
        end

      end
    end
    if $lang == 'en'
      Window.draw_font(300, 200, "Option", Font.new(56, @font))

      Window.draw_font(30, 400, 'Language(言語) : 　  English(英語)', Font.new(48, @font)) if @lang.zero?
      Window.draw_font(30, 400, 'Language(言語) :  Japanese(日本語)', Font.new(48, @font)) if @lang == 1

      Window.draw_font(30, 600, "Volume 　    　:    #{@volume}", Font.new(48, @font)) if @volume > 100
      Window.draw_font(30, 600, "Volume 　    　:    #{@volume}", Font.new(48, @font)) if @volume < 100 && @volume > 9
      Window.draw_font(30, 600, "Volume 　    　:    #{@volume}", Font.new(48, @font)) if @volume < 10

      Window.draw(Window.width / 2 - @en_normal.width / 2, 800, @en_normal) if @select != 1
      Window.draw(Window.width / 2 - @en_normal.width / 2, 800, @en_normal) if @select == 1
    else
      Window.draw_font(400, 200, '各種設定、オプション', Font.new(56, @font))

      Window.draw_font(300, 200, 'Option', Font.new(56, @font))
      Window.draw_font(30, 400, '言語(Language) :  英語　(English) ', Font.new(48, @font)) if @lang.zero?
      Window.draw_font(30, 400, '言語(Language) :  日本語(Japanese)', Font.new(48, @font)) if @lang == 1

    end

  end
end
