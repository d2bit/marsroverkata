require './lib/navigator.rb'

class MarsRover
  def initialize(position, heading)
    @navigator = Navigator.new(position, heading)
  end

  def current_position
    @navigator.current_position
  end

  def turn_left
    @navigator.turn_left
    self
  end

  def turn_right
    @navigator.turn_right
    self
  end

  def move_forward
    @navigator.move_forward
    self
  end
end
