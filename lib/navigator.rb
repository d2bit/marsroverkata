require './lib/point.rb'

class Navigator
  N = 0
  E = 1
  S = 2
  W = 3
  DIRECTIONS = [N, E, S, W]
  MOVES = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  def initialize(position, heading)
    @position = position
    @heading = heading
  end

  def current_position
    @position
  end

  def current_heading
    @heading
  end

  def turn_left
    @heading = DIRECTIONS[(@heading - 1) % 4]
  end

  def turn_right
    @heading = DIRECTIONS[(@heading + 1) % 4]
  end


  def move_forward
    x_diff, y_diff = MOVES[@heading]
    @position = Point.new(@position.x + x_diff, @position.y + y_diff)
  end
end
