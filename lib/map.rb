class Map
  def initialize(bounds)
    @bounds = bounds
  end

  def valid_position?(point)
    (0..@bounds.x).include?(point.x) && (0..@bounds.y).include?(point.y)
  end
end
