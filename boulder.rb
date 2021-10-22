class Boulder
  FRICTION = 0.7
  ELASTICITY = 0.95
  SPEED_LIMIT = 500
  attr_reader :body, :width, :height

  def initialize(window, x, y)
    @body = CP::Body.new(400, 4000)
    @body.p = CP::Vec2.new(x, y)
    @body.v_limit = SPEED_LIMIT
    @bounds = [
                [-13, -6],
                [-16, -4],
                [-16, 6],
                [-3, 12],
                [8, 12],
                [13, 10],
                [16, 3],
                [16, -4],
                [10, -9],
                [2, -11]
              ].map { |x, y| CP::Vec2.new(x, y) }
    @shape = CP::Shape::Poly.new(@body, @bounds, CP::Vec2.new(0,0))
    @shape.u = FRICTION
    @shape.e = ELASTICITY
    @width = 32
    @height = 32
    window.space.add_body(@body)
    window.space.add_body(@shape)
    @image = Gosu::Image.new('images/boulder.png')
  end
end
