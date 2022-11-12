module Fixture
        class Player < Sprite
            attr_accessor :bullets
            attr_reader :normal_image
            def initialize
                self.x = Window.width / 2 - 5
                self.y = Window.height - 100
                @normal_image = Image.load("#{$PATH}/lib/images/stages/fighter_zero_normal.png")
                @shot_image = Image.load("#{$PATH}/lib/images/stages/fighter-zero-shot.png")
                @power = 5.0
                @bullets = []
                @shot_timer = 100
                @shot_sound = Sound.new("#{$PATH}/lib/sounds/shot1.wav")
                $health = 50
            end

            def update
                @input = Input.pads

                @bullets.each { |n| n.update }
                @bullets.delete_if { |n| n.hit }
                @shot_timer += 1
                if ( Input.key_down?(K_SPACE) || @input.include?(5)) && @shot_timer > 5
                    @shot_timer = 0
                    @bullets << Player_Gun1.new(self.x + 5, self.y)
                    @bullets << Player_Gun1.new(self.x + 43, self.y)
                    @bullets << Player_Gun2.new(self.x + 5, self.y)
                    @bullets << Player_Gun3.new(self.x + 43, self.y)
                    @shot_sound.play
                end
                image
                move
            end

            def image
                if @shot_timer < 3
                    self.image = @shot_image
                    @image_width = @shot_image.width
                    @image_height = @shot_image.height
                else
                    self.image = @normal_image
                    @image_width = @normal_image.width
                    @image_height = @normal_image.height
                end
                self.draw
            end

            def move
                if Input.key_down?(K_W) || @input.include?(2) || @input.include?(22)
                    self.y -= 5
                elsif Input.key_down?(K_S) || @input.include?(3) || @input.include?(23)
                    self.y += 5
                end
                if Input.key_down?(K_A) || @input.include?(0) || @input.include?(20)
                    self.x -= 8
                elsif Input.key_down?(K_D) || @input.include?(1) || @input.include?(21)
                    self.x += 8
                end
                self.y = Window.height - @image_height if self.y > Window.height - @image_height
                self.y = 0 if self.y < 0
                self.x = Window.width - @image_width if self.x > Window.width - @image_width
                self.x = 0 if self.x < 0
            end

            def damage
                $health -= 10
            end
        end
end
