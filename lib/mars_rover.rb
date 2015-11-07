require './lib/nav.rb'

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

  def move
    diff = Nav::MOVES[@heading]
    @position = Point.new(@position.x + diff[0], @position.y + diff[1])
  end
end
