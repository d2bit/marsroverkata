class MarsRover
  def initialize(position, heading)
    @position = position
    @heading = heading
  end

  def current_position
    @position
  end

  def heading
    @heading
  end

  def turn_left
    @heading = Nav::DIRECTIONS[(@heading - 1) % 4]
  end

  def turn_right
    @heading = Nav::DIRECTIONS[(@heading + 1) % 4]
  end
end
