require 'minitest/autorun'
require './lib/navigator.rb'
require './lib/point.rb'

describe Navigator do
  before do
    @initial_position = Point.new(1, 2)
    @inicial_heading = Navigator::N
    @subject = Navigator.new(@initial_position, @inicial_heading)
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
end
