require 'minitest/autorun'
require './lib/mars_rover.rb'
require './lib/point.rb'
require './lib/navigator.rb'

describe MarsRover do
  before do
    @initial_position = Point.new(1, 2)
    @inicial_heading = Navigator::N
    @subject = MarsRover.new(@initial_position, @inicial_heading)
  end

  it 'knows its position' do
    @subject.current_position.must_equal(@initial_position)
  end

  it 'has a navigator' do
    @subject.instance_variable_get(:@navigator).class.must_equal(Navigator)
  end

  it 'responds to orders' do
    @subject
      .turn_left.move_forward
      .turn_left.move_forward
      .turn_left.move_forward
      .turn_left.move_forward
      .move_forward
    @subject.current_position.must_equal(Point.new(1, 3))
  end

  describe 'parses command' do
    it 'moves the rover' do
      @subject.parse_command('LMLMLMLMM')
      @subject.current_position.must_equal(Point.new(1, 3))
    end

    it 'raises an exception if the command is INVALID' do
      -> { @subject.parse_command('BUG') }.must_raise(MarsRover::InvalidCommandError)
    end
  end
end
