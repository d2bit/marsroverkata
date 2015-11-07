require './lib/point.rb'

class Navigator
  N = 0
  E = 1
  S = 2
  W = 3
  DIRECTIONS = { 'N' => N, 'E' => E, 'S' => S, 'W' => W }
  MOVES = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  def initialize(map, position, heading)
    @map = map
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
    @heading = DIRECTIONS.values[(@heading - 1) % 4]
  end

  def turn_right
    @heading = DIRECTIONS.values[(@heading + 1) % 4]
  end

  def move_forward
    x_diff, y_diff = MOVES[@heading]
    new_position = Point.new(@position.x + x_diff, @position.y + y_diff)

    if @map.valid_position?(new_position)
      @position = new_position
    else
      fail OutOfBoundsError, 'The current position is out of the map'
    end
  end

  def to_s
    "#{@position.x} #{@position.y} #{DIRECTIONS.keys[@heading]}"
  end

  class OutOfBoundsError < StandardError
  end
end
