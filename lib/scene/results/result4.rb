module Scene
  module Results
    class Result4 < Scene::Results::Result_Base
      def initialize
        super
        @next_scene = Scene::Stages::Stage5.new
        @win_background = Image.load("#{$path}/lib/images/result/win-picture01.jpg")
        @lose_background = Image.load("#{$path}/lib/images/result/zero_destroyed.png")
        @next_scene = Scene::Stages::Stage5.new if $health > 0
      end
    end
  end
end

