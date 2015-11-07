require 'minitest/autorun'
require './lib/navigator.rb'
require './lib/point.rb'
require './lib/map.rb'

describe Navigator do
  before do
    map = Map.new(Point.new(5, 5))
    @initial_position = Point.new(1, 2)
    @inicial_heading = Navigator::N
    @subject = Navigator.new(map, @initial_position, @inicial_heading)
  end

  it 'knows its position' do
    @subject.current_position.must_equal(@initial_position)
  end

  it 'turns left' do
    @subject.turn_left
    @subject.current_heading.must_equal(Navigator::W)
  end

  it 'turns right' do
    @subject.turn_right
    @subject.turn_right
    @subject.current_heading.must_equal(Navigator::S)
  end

  it 'moves forward' do
    @subject.move_forward
    @subject.current_position.must_equal(Point.new(1, 3))
  end

  it 'raises an error if gets out of the map' do
    @subject.turn_left
    @subject.move_forward
    -> { @subject.move_forward }.must_raise(Navigator::OutOfBoundsError)
  end
end
