module Scene
  module Results
    class Result6 < Scene::Results::Result_Base
      def initialize
        super
        begin
          @win_background = Image.load("#{$path}/lib/images/result/win-picture01.jpg")
          @lose_background = Image.load("#{$path}/lib/images/result/zero_destroyed.png")
        rescue
          @win_background = Image.load("#{$path}/lib/images/result/win-picture01.jpg")
          @lose_background = Image.load("#{$path}/lib/images/result/zero_destroyed.png")
        end
        @next_scene = Scene::NameInput.new
      end
    end
  end
end