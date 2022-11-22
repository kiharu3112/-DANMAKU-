module Scene
  module Results
    class Result1 < Scene::Results::Result_Base
      def initialize
        super
        @win_background = Image.load("#{$path}/lib/images/result/win-picture01.jpg")
        @lose_background = Image.load("#{$path}/lib/images/result/zero_destroyed.png")
        @next_scene = Scene::Stages::Stage2.new
      end
    end
  end
end
