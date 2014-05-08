module SpaceInvaders
  class Bullet < Base

    attr_reader :x_position, :y_position

    def initialize app, fireing_vehicle, going_up, bullet_speed=10
      @app = app
      @fireing_vehicle = fireing_vehicle

      @image = app.bullet_image

      @x_position = @fireing_vehicle.x_middle - @image.width/2

      @bullet_speed = bullet_speed
      @going_up = going_up

      if @going_up
        @y_position = @app.height - 50
      else
        @y_position = @fireing_vehicle.y_position + @fireing_vehicle.height
      end
    end

    def update
      if @going_up
        @y_position -= @bullet_speed
      else
        @y_position += @bullet_speed
      end
    end

    def draw
      @image.draw @x_position, @y_position, 1
    end

    def out_of_screen
      if @going_up
        @y_position < 0
      else
        @y_position > @app.height
      end
    end

  end
end