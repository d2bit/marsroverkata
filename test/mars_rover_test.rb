require 'minitest/autorun'
require './lib/mars_rover.rb'
require './lib/point.rb'
require './lib/nav.rb'

describe MarsRover do
  before do
    @initial_position = Point.new(1, 2)
    @inicial_heading = Nav::N
    @mars_rover = MarsRover.new(@initial_position, @inicial_heading)
  end

  it 'has a position' do
    @mars_rover.current_position.must_equal(@initial_position)
  end

  it 'turns left' do
    @mars_rover.turn_left
    @mars_rover.heading.must_equal(Nav::W)
  end

  it 'turns right' do
    @mars_rover.turn_right
    @mars_rover.turn_right
    @mars_rover.heading.must_equal(Nav::S)
  end
end
