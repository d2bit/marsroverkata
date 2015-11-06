require 'minitest/autorun'
require './lib/mars_rover.rb'

describe MarsRover do
  it 'has a position' do
    mars_rover = MarsRover.new([1, 2])
    mars_rover.current_position.must_equal([1, 2])
  end
end
