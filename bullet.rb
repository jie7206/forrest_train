class Bullet

  SPEED = 10
  attr_reader :x, :y, :radius

  def initialize(window, x, y, angle)
    @x = x
    @y = y
    @direction = angle
    @path = Pathname.new(File.dirname(__FILE__)).realpath
    @image = Gosu::Image.new("#{@path}/Assets/Images/bullet.png")
    @radius = 5
    @window = window
  end

  def move
      @x += Gosu.offset_x(@direction, SPEED)
      @y += Gosu.offset_y(@direction, SPEED)
  end

  def draw
    @image.draw(@x - @radius, @y - @radius, 0.5, 0.18, 0.18)
  end

  def onscreen?
    right = @window.width + @radius
    left = -@radius
    top = -@radius
    bottom = @window.height + @radius
    @x > left and @x < right and @y > top and @y < bottom
  end

end
