module Scene
    class Stage1 < Scene::Stage
        include Fixture::Stage1
        def initialize
            @player = Fixture::Player.new
            @carrier = Image.load("#{$PATH}/lib/images/Carrier.png")
            @destroy_enemy = 0
            @stage_num = 1
            super
        end

        def update
            super
        end

        def start
            if @count > 60
                background_move_draw_1
                Window.draw(Window.width / 2 - @carrier.width / 2, (@count - 60) * 4 - (@carrier.height - 300)  / 2, @carrier)
                if @count > 360
                    @player.y -= 5
                end
                @player.image
                if @count > 600
                    @player.y = Window.height + 50
                    @player.y -= (@count - 600)
                    if @player.y == Window.height - 60
                        @scene = :game
                        @count = 0
                    end
                end
            else
                just_draw
                Window.draw(Window.width / 2 - @carrier.width / 2, -1 * (@carrier.height - 300)  / 2, @carrier)
                @player.image
            end
        end

        def game
            case @count
            when 0
                @enemies << Enemy_1.new(Window.width / 4, -200)
                @enemies << Enemy_1.new(Window.width / 2, -150)
                @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            when 500
                @enemies << Enemy_1.new(Window.width / 4, -200)
                @enemies << Enemy_1.new(Window.width / 2, -150)
                @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            when 1000
                @enemies << Enemy_1.new(Window.width / 4, -200)
                @enemies << Enemy_1.new(Window.width / 2, -150)
                @enemies << Enemy_1.new(Window.width / 4 * 3, -200)
            end
            @enemies.each { |n| n.update }
            @enemies.delete_if { |n| n.health <= 0 }
            @enemies.each do |n|
                n.bullets.each do |i|
                    if i === @player
                        @player.damage
                        i.hit = true
                    end
                end
            end

            @player.bullets.each do |n|
                @enemies.each do |i|
                    if i === n
                        i.damage
                        if i.health <= 0
                            @destroy_enemy += 1
                            $score += 10
                        end

                        n.hit = true
                    end
                end
            end

            ###############################################
            # check
            if (@enemies.count == 0 && @count > 1300) || $health <= 0
                @scene = :end
                @player.image = @player.normal_image
            end
            super
        end

        def end_scene
            super
        end

        def finish?
            super
        end

        def next_scene
            super
        end
    end
end
