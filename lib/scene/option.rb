# frozen_string_literal: true

module Scene
  class Option < Scene::Base
    def initialize
      super
      @lang = 0 if $lang == 'en'
      @lang = 1 if $lang == 'ja'
      @volume = $volume
      @select = 0 # 0:lang 1:volume 2:apply 3:clear data
      @confirm_clear = false
      @confirm_select = false
      @en_apply_normal = Image.load("#{$PATH}/lib/images/option/en_normal.png")
      @en_apply_select = Image.load("#{$PATH}/lib/images/option/en_select.png")
      @ja_apply_normal = Image.load("#{$PATH}/lib/images/option/ja_normal.png")
      @ja_apply_select = Image.load("#{$PATH}/lib/images/option/ja_select.png")
      @en_delete_normal = Image.load("#{$PATH}/lib/images/option/en_delete_normal.png")
      @en_delete_select = Image.load("#{$PATH}/lib/images/option/en_delete_select.png")
      @ja_delete_normal = Image.load("#{$PATH}/lib/images/option/ja_delete_normal.png")
      @ja_delete_select = Image.load("#{$PATH}/lib/images/option/ja_delete_select.png")
      @touch_sound = Sound.new("#{$PATH}/lib/sounds/title_button_touch.wav")
      @click_sound = Sound.new("#{$PATH}/lib/sounds/title_button_click.wav")
      @arrow_right = Image.load("#{$PATH}/lib/images/option/arrow_right.png")
      @arrow_left = Image.load("#{$PATH}/lib/images/option/arrow_left.png")
      @ja_alert_no = Image.load("#{$PATH}/lib/images/option/ja_alert_no.png")
      @ja_alert_yes = Image.load("#{$PATH}/lib/images/option/ja_alert_yes.png")
      @en_alert_no = Image.load("#{$PATH}/lib/images/option/en_alert_no.png")
      @en_alert_yes = Image.load("#{$PATH}/lib/images/option/en_alert_yes.png")
    end

    def update
      super
      draw

      if @confirm_clear
        if Input.pad_push?(4)
          @confirm_clear = false
          @click_sound.play
        end
        if $lang == 'en'
          Window.draw(300, 200, @en_alert_no) unless @confirm_select
          Window.draw(300, 200, @en_alert_yes) if @confirm_select
        else
          Window.draw(300, 200, @ja_alert_yes) if @confirm_select
          Window.draw(300, 200, @ja_alert_no) unless @confirm_select
        end

        if Input.pad_push?(0) || Input.pad_push?(20) || Input.key_push?(K_LEFTARROW) || Input.key_push?(K_A)
          @touch_sound.play
          @confirm_select = true
        end
        if Input.pad_push?(1) || Input.pad_push?(21) || Input.key_push?(K_RIGHTARROW) || Input.key_push?(K_D)
          @touch_sound.play
          @confirm_select = false
        end

        if (Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)) && @confirm_select
          @click_sound.play
          @confirm_clear = false
          @confirm_select = false
          @select = 0
          clear_rank
        end
      end

      #############################################################################################################
      return if @confirm_clear

      if Input.pad_push?(4)
        @is_finish = true
        @next_scene = Scene::Opening.new
        return
      end
      if Input.pad_push?(22) || Input.key_push?(K_W) || Input.key_push?(K_UPARROW)
        @select -= 1 if @select.positive?
        @touch_sound.play
      elsif Input.pad_push?(23) || Input.key_push?(K_S) || Input.key_push?(K_DOWNARROW)
        @select += 1 if @select < 4
        @touch_sound.play
      end
      if @select.zero?
        [0, 1, 20, 21].each do |n|
          next unless Input.pad_push?(n)

          @touch_sound.play
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
        if (Input.pad_push?(0) || Input.pad_push?(20) || Input.key_push?(K_LEFTARROW) || Input.key_push?(K_A)) && @volume.positive?
          @volume -= 1
          @touch_sound.play
        elsif (Input.pad_push?(1) || Input.pad_push?(21) || Input.key_push?(K_RIGHTARROW) || Input.key_push?(K_D)) && @volume < 100
          @volume += 1
          @touch_sound.play
        end
      elsif @select == 2
        if Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
          apply
          @click_sound.play
        end
      elsif @select == 3
        if Input.pad_push?(5) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
          @confirm_clear = true
          @click_sound.play
        end
      end
    end

    def draw
      Window.draw_font(Window.width / 2 - 5, 300, ':', Font.new(48, @font))
      Window.draw_font(Window.width / 2 - 5, 400, ':', Font.new(48, @font))
      Window.draw_font(Window.width / 2 + 260, 400, @volume.to_s, Font.new(48, @font))

      if $lang == 'en'
        Window.draw_font(500, 100, 'Option', Font.new(70, @font))

        Window.draw_font(150, 300, 'Language(言語)       English(英語)', Font.new(48, @font)) if @lang.zero?
        Window.draw_font(150, 300, 'Language(言語)      Japanese(日本語)', Font.new(48, @font)) if @lang == 1

        Window.draw_font(150, 400, 'Volume', Font.new(48, @font))

        Window.draw(Window.width / 2 - @en_apply_normal.width / 2, 600, @en_apply_normal) if @select != 2
        Window.draw(Window.width / 2 - @en_apply_select.width / 2, 600, @en_apply_select) if @select == 2

        Window.draw(Window.width / 2 - @en_delete_normal.width / 2, 800, @en_delete_normal) if @select != 3
        Window.draw(Window.width / 2 - @en_delete_select.width / 2, 800, @en_delete_select) if @select == 3
      else
        Window.draw_font(500, 100, 'オプション', Font.new(70, @font))

        Window.draw_font(150, 300, 'ゲンゴ(Language)　     エイゴ(English) ', Font.new(48, @font)) if @lang.zero?
        Window.draw_font(150, 300, 'ゲンゴ(Language) 　    ニホンゴ(Japanese)', Font.new(48, @font)) if @lang == 1

        Window.draw_font(150, 400, 'オンリョウ', Font.new(48, @font))
        Window.draw(Window.width / 2 - @ja_apply_normal.width / 2, 600, @ja_apply_normal) if @select != 2
        Window.draw(Window.width / 2 - @ja_apply_select.width / 2, 600, @ja_apply_select) if @select == 2

        Window.draw(Window.width / 2 - @ja_delete_normal.width / 2, 800, @ja_delete_normal) if @select != 3
        Window.draw(Window.width / 2 - @ja_delete_select.width / 2, 800, @ja_delete_select) if @select == 3
      end

      case @select
      when 0
        Window.draw(700, 312, @arrow_left)
        Window.draw(1200, 312, @arrow_right)
      when 1
        Window.draw(700, 412, @arrow_left)
        Window.draw(1200, 412, @arrow_right)
      end
    end

    def apply
      $lang = 'ja' if @lang == 1
      $lang = 'en' if @lang.zero?
      $volume = @volume

      @is_finish = true
      @next_scene = Scene::Opening.new
    end

    def clear_rank
      File.open('user.json', 'r') do |file|
        @data = JSON.load(file)
        @data["ranking"] = []
        file.close
      end
      File.open('user.json', 'w') do |file|
        @data = JSON.pretty_generate(@data)
        file.puts(@data)
        file.close
      end
    end
  end
end
