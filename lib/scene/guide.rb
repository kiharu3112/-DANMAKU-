module Scene
  class Guide < Scene::Base
    def initialize
      super
      @click_sound = Sound.new("#{$path}/lib/sounds/title_button_click.wav")
      @next_scene = Scene::Opening.new
      @image = []
      6.times do |n|
        @image[n] = Image.load("#{$path}/lib/images/guide/ja_#{n + 1}.png") if $lang == "ja"
        @image[n] = Image.load("#{$path}/lib/images/guide/en_#{n + 1}.png") if $lang == "en"
      end
      @page = 0
    end
    def update
      super
      if Input.pad_push?(5) || Input.pad_push?(4) || Input.key_push?(K_SPACE) || Input.key_push?(K_RETURN)
        @is_finish = true
        @click_sound.play
      end
      Window.draw(50, 50, @image[@page]) if @page >= 0 && @page < 6
      @is_finish = true if @page < 0 || @page > 5
      if Input.pad_push?(1) || Input.pad_push?(21) || Input.key_push?(K_D)
        @page += 1
        @click_sound.play.set_volume($volume)
      end
      if Input.pad_push?(0) || Input.pad_push?(20) || Input.key_push?(K_A)
        @page -= 1
        @click_sound.play.set_volume($volume)
      end
    end
  end
end
