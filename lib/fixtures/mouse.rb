class Mouse < Sprite
    def update
        self.x = Input.mouse_pos_x
        self.y = Input.mouse_pos_y
        self.image = Image.new(1, 1, C_WHITE)
    end
end